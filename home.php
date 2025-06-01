<!-- Header-->
<header class="bg-dark py-5" id="main-header">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Your Pets Deserve The Best</h1>
            <p class="lead fw-normal text-white-50 mb-0">Looking for your pet's needs? Shop Now!</p>
        </div>
    </div>
</header>
<!-- Automatic Slideshow Section -->
<div class="container px-4 px-lg-5 my-5">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="slideshow-container" style="max-width: 1200px; margin: 0 auto; position: relative;">
                <div class="slideshow-wrapper" style="overflow: hidden; position: relative; height: 400px;">
                    <div class="slideshow-slide" style="position: absolute; width: 100%; height: 100%; opacity: 0; transition: opacity 1s ease-in-out;">
                        <img src="store.jpg" alt="Store Front" style="width: 100%; height: 100%; object-fit: cover;">
                        <div class="slideshow-caption" style="position: absolute; bottom: 20px; left: 0; right: 0; text-align: center; color: white; background: rgba(0,0,0,0.5); padding: 10px;">
                            <h3>Visit Our Store</h3>
                            <p>Experience our welcoming atmosphere</p>
                        </div>
                    </div>
                    <div class="slideshow-slide" style="position: absolute; width: 100%; height: 100%; opacity: 0; transition: opacity 1s ease-in-out;">
                        <img src="redfish.jpg" alt="Pet Products" style="width: 100%; height: 100%; object-fit: cover;">
                        <div class="slideshow-caption" style="position: absolute; bottom: 20px; left: 0; right: 0; text-align: center; color: white; background: rgba(0,0,0,0.5); padding: 10px;">
                            <h3>Quality Products</h3>
                            <p>Best selection for your pets</p>
                        </div>
                    </div>
                    <div class="slideshow-slide" style="position: absolute; width: 100%; height: 100%; opacity: 0; transition: opacity 1s ease-in-out;">
                        <img src="oyechamps.jpg" alt="Pet Care" style="width: 100%; height: 100%; object-fit: cover;">
                        <div class="slideshow-caption" style="position: absolute; bottom: 20px; left: 0; right: 0; text-align: center; color: white; background: rgba(0,0,0,0.5); padding: 10px;">
                            <h3>Expert Care</h3>
                            <p>Professional service for your pets</p>
                        </div>
                    </div>
                    <div class="slideshow-slide" style="position: absolute; width: 100%; height: 100%; opacity: 0; transition: opacity 1s ease-in-out;">
                        <img src="cutefish.jpg" alt="Fish Collection" style="width: 100%; height: 100%; object-fit: cover;">
                        <div class="slideshow-caption" style="position: absolute; bottom: 20px; left: 0; right: 0; text-align: center; color: white; background: rgba(0,0,0,0.5); padding: 10px;">
                            <h3>Fish Collection</h3>
                            <p>Beautiful and exotic fish species</p>
                        </div>
                    </div>
                    <div class="slideshow-slide" style="position: absolute; width: 100%; height: 100%; opacity: 0; transition: opacity 1s ease-in-out;">
                        <img src="akwa.jpg" alt="Aquarium Supplies" style="width: 100%; height: 100%; object-fit: cover;">
                        <div class="slideshow-caption" style="position: absolute; bottom: 20px; left: 0; right: 0; text-align: center; color: white; background: rgba(0,0,0,0.5); padding: 10px;">
                            <h3>Aquarium Supplies</h3>
                            <p>Complete aquarium setup and accessories</p>
                        </div>
                    </div>
                    <div class="slideshow-slide" style="position: absolute; width: 100%; height: 100%; opacity: 0; transition: opacity 1s ease-in-out;">
                        <img src="prodok.jpg" alt="Pet Accessories" style="width: 100%; height: 100%; object-fit: cover;">
                        <div class="slideshow-caption" style="position: absolute; bottom: 20px; left: 0; right: 0; text-align: center; color: white; background: rgba(0,0,0,0.5); padding: 10px;">
                            <h3>Pet Accessories</h3>
                            <p>Essential supplies for your pets</p>
                        </div>
                    </div>
                </div>
                <div class="slideshow-dots" style="text-align: center; padding: 10px;">
                    <span class="dot active" style="height: 12px; width: 12px; margin: 0 5px; background-color: #bbb; border-radius: 50%; display: inline-block; cursor: pointer;"></span>
                    <span class="dot" style="height: 12px; width: 12px; margin: 0 5px; background-color: #bbb; border-radius: 50%; display: inline-block; cursor: pointer;"></span>
                    <span class="dot" style="height: 12px; width: 12px; margin: 0 5px; background-color: #bbb; border-radius: 50%; display: inline-block; cursor: pointer;"></span>
                    <span class="dot" style="height: 12px; width: 12px; margin: 0 5px; background-color: #bbb; border-radius: 50%; display: inline-block; cursor: pointer;"></span>
                    <span class="dot" style="height: 12px; width: 12px; margin: 0 5px; background-color: #bbb; border-radius: 50%; display: inline-block; cursor: pointer;"></span>
                    <span class="dot" style="height: 12px; width: 12px; margin: 0 5px; background-color: #bbb; border-radius: 50%; display: inline-block; cursor: pointer;"></span>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    let currentSlide = 0;
    const slides = document.querySelectorAll('.slideshow-slide');
    const dots = document.querySelectorAll('.dot');
    
    // Show first slide
    slides[0].style.opacity = '1';
    
    function showSlide(n) {
        // Hide all slides
        slides.forEach(slide => slide.style.opacity = '0');
        dots.forEach(dot => dot.style.backgroundColor = '#bbb');
        
        // Show current slide
        slides[n].style.opacity = '1';
        dots[n].style.backgroundColor = '#717171';
    }
    
    function nextSlide() {
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide(currentSlide);
    }
    
    // Add click events to dots
    dots.forEach((dot, index) => {
        dot.addEventListener('click', () => {
            currentSlide = index;
            showSlide(currentSlide);
        });
    });
    
    // Auto advance slides every 5 seconds
    setInterval(nextSlide, 5000);
});
</script>

<style>
.slideshow-container {
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}
.slideshow-slide {
    border-radius: 10px;
}
.slideshow-caption {
    border-radius: 0 0 10px 10px;
}
.dot.active {
    background-color: #717171 !important;
}
/* .about-card {
    background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
    border: 3px solid #ff8c42;
} */
.about-card h3 {
    color: #ff5e62;
    font-weight: bold;
}
.about-card .lead {
    color: #ff8c42;
}
.about-card ul li:nth-child(1) { color: #2dce98; }
.about-card ul li:nth-child(2) { color: #f368e0; }
.about-card ul li:nth-child(3) { color: #ff8c42; }
.about-card ul li:nth-child(4) { color: #48dbfb; }
.about-card .text-muted, .about-card p, .about-card ul {
    color: #4e2a84 !important;
}
.product-item {
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.product-item:hover {
    transform: scale(1.04);
    box-shadow: 0 8px 24px rgba(0,0,0,0.18);
    z-index: 2;
}
</style>
    <!-- Shop Information Section -->
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <?php 
                $products = $conn->query("SELECT * FROM `products` where status = 1 order by rand() limit 8 ");
                while($row = $products->fetch_assoc()):
                    $upload_path = base_app.'/uploads/product_'.$row['id'];
                    $img = "";
                    if(is_dir($upload_path)){
                        $fileO = scandir($upload_path);
                        if(isset($fileO[2]))
                            $img = "uploads/product_".$row['id']."/".$fileO[2];
                    }
                    $inventory = $conn->query("SELECT * FROM inventory where product_id = ".$row['id']);
                    $inv = array();
                    while($ir = $inventory->fetch_assoc()){
                        $inv[$ir['size']] = number_format($ir['price']);
                    }
            ?>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-5 d-flex">
                <a href=".?p=view_product&id=<?php echo md5($row['id']) ?>" class="text-decoration-none w-100">
                    <div class="card h-100 product-item">
                        <!-- Product image-->
                        <img class="card-img-top w-100" src="<?php echo validate_image($img) ?>" alt="..." style="object-fit:cover; height:200px;" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder text-dark"><?php echo $row['product_name'] ?></h5>
                                <!-- Product price-->
                                <?php foreach($inv as $k=> $v): ?>
                                    <span class="text-dark"><b><?php echo $k ?>: </b><?php echo $v ?></span>
                                <?php endforeach; ?>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <span class="btn btn-flat btn-primary">View</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <?php endwhile; ?>
        </div>
    </div>
    <!-- Shop Information Section -->
    <div class="container px-4 px-lg-5 my-5">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card shadow-sm about-card" style="width: 1200px; margin: 0 auto; background: rgb(10, 108, 243);">
                    <div class="card-body p-4 text-center">
                    <img src="https://media.giphy.com/media/3oriO0OEd9QIDdllqo/giphy.gif" alt="Cute Pet" style="width: 120px; border-radius: 12px; margin-bottom: 16px; box-shadow: 0 2px 8px rgba(0,0,0,0.12);">
                        <h3 class="mb-4" style="color:white; font-weight: bold;">About Our Pet Shop</h3>
                        <div class="text-muted" style="color:white !important;">
                            <p class="lead" style="color:white !important;">
                                Welcome to your one-stop shop for all things pets! At our store, we're passionate about providing exceptional care, quality products, and expert advice for your furry, feathered, and finned friends.
                            </p>
                            <p style="color:white !important;">Here's what you'll find at our shop:</p>
                            <ul class="list-unstyled" style="color:white !important;">
                                <li style="color:white !important;">Premium pet food and essential supplies</li>
                                <li style="color:white !important;">Friendly guidance from knowledgeable staff</li>
                                <li style="color:white !important;">A wide variety of toys, treats, and accessories</li>
                                <li style="color:white !important;">Professional grooming and care services</li>
                            </ul>
                            <p style="color:white !important;">
                                Stop by today and see why pet owners in our community trust us for all their pet needs. Your pet's happiness and well-being are our top priorities!
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Video Section -->
    <div class="container px-4 px-lg-5 my-5">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card shadow-sm" style="width: 1200px; margin: 0 auto;">
                    <div class="card-body p-0">
                        <video class="w-100" controls style="max-height: 400px; object-fit: contain;">
                            <source src="oyeevid.mp4" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    </div>
                </div>
            </div>
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-12 text-center">
                <p class="lead mb-4">Experience the joy of shopping for your beloved pets with our extensive collection of premium products. From nutritious food to stylish accessories, we ensure your pets receive only the best. Our expert staff is always ready to assist you in finding the perfect items for your furry friends. Join our community of pet lovers and discover why we're the preferred choice for pet care essentials.</p>
                <a href="login.php" class="btn btn-primary btn-lg px-5">Shop Now</a>
            </div>
        </div>
    </div>

    <!-- Shop Location Section -->
    <div class="container px-4 px-lg-5 my-5">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card shadow-sm" style="width: 1200px; margin: 0 auto;">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <!-- Image Column -->
                            <div class="col-md-6">
                                <div class="location-image-container" style="height: 400px; overflow: hidden;">
                                    <img src="store.jpg" alt="Shop Location" class="img-fluid rounded" style="width: 100%; height: 100%; object-fit: cover;">
                                </div>
                            </div>
                            <!-- Text Column -->
                            <div class="col-md-6 p-4">
                                <h3 class="mb-4 display-5" style="font-size:2.5rem;">Visit Our Shop</h3>
                                <div class="text-muted" style="font-size: 1.3rem;">
                                    <p class="lead" style="font-size: 1.5rem; font-weight: 500;">Find us at:</p>
                                    <p style="font-size: 1.2rem;">
                                        <i class="fas fa-map-marker-alt me-2"></i>
                                        <a href="https://www.google.com/maps/search/?api=1&query=Pearl+St.+Marfori+Heights+Davao+City+Philippines"
                                           target="_blank"
                                           class="text-decoration-none text-muted hover-primary"
                                           style="transition: color 0.3s ease; font-size: 1.2rem;">
                                            Pearl St., Marfori Heights, Davao City, Philippines
                                        </a>
                                    </p>
                                    <p style="font-size: 1.2rem;"><i class="fas fa-clock me-2"></i> <b>Open Hours:</b></p>
                                    <ul class="list-unstyled" style="font-size: 1.15rem;">
                                        <li>Monday - Friday: 9:00 AM - 8:00 PM</li>
                                        <li>Saturday: 9:00 AM - 6:00 PM</li>
                                        <li>Sunday: 10:00 AM - 4:00 PM</li>
                                    </ul>
                                    <p style="font-size: 1.2rem;"><i class="fas fa-phone me-2"></i> <b>Contact:</b> 0930 154 6634</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

