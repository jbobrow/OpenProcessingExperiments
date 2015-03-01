
//ex10 images2
/* @pjs preload="flw.jpg";"monks.jpg";"empire200.jpg"; */
PImage img1 = loadImage ("FLW.jpg");
PImage img2 = loadImage ("monksBW.jpg");
PImage img3 = loadImage ("EMPIRE200.jpg");

size (700, 700);

//blend(x,y,width,height,dx,dy,dwidth,dhieght,mode)

/*img.blend (img2, 0, 0, 500, 500, 0, 200, 200, 300, SUBTRACT);
 img.blend (img1, 100, 100, 700, 700, 0, 150, 100, 100, SOFT_LIGHT);
 image (img, 90, 0);
 filter (BLUR);*/


background (255);


   tint (15,240,208, 150);
 img1 = loadImage ("FLW.jpg");
    image(img1, 50, 0, 200, 300);
    
   tint (240,165,15, 150);
 img2 = loadImage ("monksBW.jpg");
     image(img2, 0, 0, width, height);

  tint (186, 15,240, 150);
img3 = loadImage ("EMPIRE200.jpg");
      image(img3, 0, 250, 300, 400);
      

        tint (186, 15,240, 150);
img3 = loadImage ("EMPIRE200.jpg");
      image(img3, 500, 80, 200, 300);
      
            filter(ERODE);




