
//import processing.pdf.*;


  size(800, 800); 

 
//beginRecord(PDF,"Fijo 5.pdf");
  background(0);
  for (int x = 0; x < width; x += 1) {

   fill(random(x+x),random(150),random(200),5);
   stroke(150,random(120),random(255),15);
    bezier(x+800, 40+x, 110, 120, 440, 300, 240-(x/16), 300);
    // bezier(300,240-(x/16),300,440,120,110,40+x,x+800);
     strokeWeight(random(2));
    stroke(random(150),random(200),random(120),5);
      bezier(300,240-(x/1),random(300),440,120,110,40,x-800);
    
    rotate(x+500);
    stroke(random(150),random(210),random(100),5);
    fill(random(150),random(210),random(100),5);
    strokeWeight(random(9));
  //  line(150,x+500,x+x+x+x+x,150+x);
  
  rotate(x+610);  
   stroke(random(201),random(100),random(120),15);
  
//line ( x+x+x+x+x-x,200,350,x+500);

}
//endRecord();
