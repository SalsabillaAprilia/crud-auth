const express = require('express');
const router = express.Router();
const productController = require('../controllers/import_productsController');
const protect = require('../middleware/authMiddleware');

router.post('/', protect, productController.create);
router.get('/', protect, productController.getAll);
router.get('/:id', protect, productController.getOne);
router.put('/:id', protect, productController.update);
router.delete('/:id', protect, productController.remove);

module.exports = router;