const Product = require('../models/import_productsModel');

const secret = 'rahasia';

exports.create = (req, res) => {
  const { user_id, nama_produk, kategori, negara_asal, biaya_impor, harga, stok, created_at } = req.body;
  const newProduct = { user_id, nama_produk, kategori, negara_asal, biaya_impor, harga, stok, created_at };

  Product.create(newProduct, (err) => {
    if (err) return res.status(500).json(err);
    res.json({ message: 'Product created' });
  });
};

exports.getAll = (req, res) => {
  Product.findAll((err, import_products) => {
    if (err) return res.status(500).json(err);
    res.json(import_products);
  });
};

exports.getOne = (req, res) => {
  Product.findById(req.params.id, (err, import_products) => {
    if (err || import_products.length === 0) return res.status(404).json({ message: 'Product not found' });
    res.json(import_products[0]);
  });
};

exports.update = (req, res) => {
  const { nama_produk, kategori, negara_asal, biaya_impor, harga, stok } = req.body;
  const updatedProduct = { nama_produk, kategori, negara_asal, biaya_impor, harga, stok };

  Product.update(req.params.id, updatedProduct, (err) => {
    if (err) return res.status(500).json(err);
    res.json({ message: 'Product updated' });
  });
};

exports.remove = (req, res) => {
  Product.delete(req.params.id, (err) => {
    if (err) return res.status(500).json(err);
    res.json({ message: 'Product deleted' });
  });
};