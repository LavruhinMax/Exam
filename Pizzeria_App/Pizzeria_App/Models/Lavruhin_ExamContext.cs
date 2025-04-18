using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Pizzeria_App.Models
{
    public partial class Lavruhin_ExamContext : DbContext
    {
        public Lavruhin_ExamContext()
        {
        }

        public Lavruhin_ExamContext(DbContextOptions<Lavruhin_ExamContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Client> Clients { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Pizza> Pizzas { get; set; }
        public virtual DbSet<Position> Positions { get; set; }
        public virtual DbSet<Size> Sizes { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=hqvla3302s01\\KITP;Database=Lavruhin_Exam;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Cyrillic_General_CI_AS");

            modelBuilder.Entity<Client>(entity =>
            {
                entity.ToTable("Client");

                entity.Property(e => e.ClientId).HasColumnName("Client_ID");

                entity.Property(e => e.ClientFirstName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Client_First_Name");

                entity.Property(e => e.ClientLastName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Client_Last_Name");

                entity.Property(e => e.ClientMiddleName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Client_Middle_Name");

                entity.Property(e => e.Flat)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.House)
                    .HasMaxLength(5)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Phone_Number");

                entity.Property(e => e.Street)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.ToTable("Order");

                entity.Property(e => e.OrderId).HasColumnName("Order_ID");

                entity.Property(e => e.ClientId).HasColumnName("Client_ID");

                entity.Property(e => e.OrderDate)
                    .HasColumnType("date")
                    .HasColumnName("Order_Date");

                entity.Property(e => e.OrderPrice)
                    .HasColumnType("decimal(10, 2)")
                    .HasColumnName("Order_Price");

                entity.Property(e => e.PositionId).HasColumnName("Position_ID");

                entity.HasOne(d => d.Client)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.ClientId)
                    .HasConstraintName("FK__Order__Client_ID__2F10007B");

                entity.HasOne(d => d.Position)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.PositionId)
                    .HasConstraintName("FK__Order__Position___2E1BDC42");
            });

            modelBuilder.Entity<Pizza>(entity =>
            {
                entity.ToTable("Pizza");

                entity.Property(e => e.PizzaId).HasColumnName("Pizza_ID");

                entity.Property(e => e.Ingredients)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.PizzaName)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Pizza_Name");
            });

            modelBuilder.Entity<Position>(entity =>
            {
                entity.ToTable("Position");

                entity.Property(e => e.PositionId).HasColumnName("Position_ID");

                entity.Property(e => e.PizzaId).HasColumnName("Pizza_ID");

                entity.Property(e => e.Price).HasColumnType("decimal(10, 2)");

                entity.Property(e => e.SizeId).HasColumnName("Size_ID");

                entity.HasOne(d => d.Pizza)
                    .WithMany(p => p.Positions)
                    .HasForeignKey(d => d.PizzaId)
                    .HasConstraintName("FK__Position__Pizza___2A4B4B5E");

                entity.HasOne(d => d.Size)
                    .WithMany(p => p.Positions)
                    .HasForeignKey(d => d.SizeId)
                    .HasConstraintName("FK__Position__Size_I__2B3F6F97");
            });

            modelBuilder.Entity<Size>(entity =>
            {
                entity.ToTable("Size");

                entity.Property(e => e.SizeId).HasColumnName("Size_ID");

                entity.Property(e => e.Size1)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("Size");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
