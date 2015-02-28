
/* @pjs preload = "background.jpg"; */

size(400, 400);
smooth();
background(#1F5A6F);

    PImage img;                                   //background image
      img = loadImage("background.jpg");
      image(img,0,0,400,400);
     
     
    stroke(255, 255, 255);                       //legs
    strokeWeight(8);
    fill(255, 255, 255);
        line(220,281,220,350);
        line(185,281,185,350);

    noStroke();                                  //upperleg
    fill(181, 230, 242);
        ellipse(220,281,40,74);
        ellipse(185,281,40,72);
        fill(181, 230, 242, 200);
      rect(400,400,100,200);
    
    beginShape();
    fill(190, 250, 209);                      //body
    rect(161,253,81,50);
        ellipse(201.5,257,81,86);
    endShape();
    
    fill(10, 23, 89);                           //ball1
        ellipse(147,70,25,25);

    stroke(255, 255, 255);
    strokeWeight(8);
        line(166,102,150,77);

    noStroke();                                //headouter
        fill(181, 230, 242, 200);
        ellipse(200,150,150,150);
  
    fill(180, 240, 232);                //innerhead
        ellipse(200,150,125,125);
    
    fill(10, 23, 89);
        ellipse(150,160,20,10);
        ellipse(227,38,30,30);

    stroke(255, 255, 255);
    strokeWeight(11);
        line(273,55,235,44);

    stroke(255, 255, 255);
    strokeWeight(15);
        line(244,105,275,67);

    noStroke();                                  //eyenosemouth
    fill(10, 23, 89);
        ellipse(200,160,20,10);
        ellipse(177,189,23,7);
    fill(10, 23, 89);
        ellipse(280,62,50,50);

beginShape();
    fill(10, 23, 89);                           //feet
ellipse(171,347,20,20);
ellipse(180,349,25,16);
rect(169,347,24,10);

ellipse(207,347,20,20);
ellipse(213.5,349,25,16);
rect(202,347,24,10);
endShape();
