const db = require('../config/db');

const Product = {
  create: (data, callback) => {
    const sql = `
      INSERT INTO import_products 
      (user_id, nama_produk, kategori, negara_asal, biaya_impor, harga, stok, created_at) 
      VALUES (?, ?, ?, ?, ?, ?,?,?)
    `;
    const values = [
      data.user_id,
      data.nama_produk,
      data.kategori,
      data.negara_asal,
      data.biaya_impor,
      data.harga,
      data.stok,
      data.created_at
    ];
    db.query(sql, values, callback);
  },

  findAll: (callback) => {
    db.query('SELECT * FROM import_products', callback);
  },

  findById: (id, callback) => {
    db.query('SELECT * FROM import_products WHERE id = ?', [id], callback);
  },

  update: (id, data, callback) => {
    const sql = `
      UPDATE import_products SET 
      nama_produk = ?, kategori = ?, negara_asal = ?, 
      biaya_impor = ?, harga = ?, stok = ? 
      WHERE id = ?
    `;
    const values = [
      data.nama_produk,
      data.kategori,
      data.negara_asal,
      data.biaya_impor,
      data.harga,
      data.stok,
      id,
    ];
    db.query(sql, values, callback);
  },

  delete: (id, callback) => {
    db.query('DELETE FROM import_products WHERE id = ?', [id], callback);
  },
};

module.exports = Product;
