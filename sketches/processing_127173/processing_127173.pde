
/* @pjs preload = "a.png"; */
PImage Apple;
float roll = 0;//kaitennokakudo
float x = 400;//xzahyou
float y = 0;//yzahyou

void setup(){
  size(450,450);
background(153); 

textAlign(CENTER); 
   textSize(150); 
   text("Apple",width/2,height/2); 


Apple = loadImage("a.png");//gazou
 
}

void draw(){
if (mousePressed == true)//kurikkusuruto ugoku
       {


  background(#333333);//haikei 
  translate(x, y);//x.ynoitini kitenwoidou
  rotate(roll);//kaiten
 image(Apple, 0, 0); //x.y tyuusinni
  roll += 0.01;//kaitennokakudo
  y++;//y sita

translate(50, y);//apple
  rotate(roll);
  image( Apple, 50, 0 );
  
  translate(60, y);
  rotate(roll);
  image( Apple, 90, 0 );
  
  translate(x, y);
  rotate(roll);
  image( Apple, 30, 90 );
  
  translate(50, y);
  rotate(roll);
  image( Apple, 25, 100 );
  
  translate(x, 60);
  rotate(roll);
  image( Apple, 0, 90 );
  
  translate(x, y);
  rotate(roll);
  image( Apple, 30, 90 );
  
  translate(x, 65);
  rotate(roll);
  image( Apple, 30, 90 );
  
  translate(x, 90);
  rotate(roll);
  image( Apple, 170, 90 );
  
  translate(x, 186);
  rotate(roll);
  image( Apple, 460, 90 );
  
  translate(x, 250);
  rotate(roll);
  image( Apple, 3, 90 );
  
  translate(x, 280);
  rotate(roll);
  image( Apple, 0, 60 );
  
  translate(x, 156);
  rotate(roll);
  image( Apple, 30, 49 );
  
  translate(x, 280);
  rotate(roll);
  image( Apple, 39, 65 );
  
  translate(x, 264);
  rotate(roll);
  image( Apple, 65, 65 );
  
  translate(x, 351);
  rotate(roll);
  image( Apple, 30, 150 );
  
  translate(x, 245);
  rotate(roll);
  image( Apple, 240, 340 );
  
  translate(x, 432);
  rotate(roll);
  image( Apple, 240, 322 );
  
  translate(x, 432);
  rotate(roll);
  image( Apple, 30, 90 );
  
  translate(51, 31);
  rotate(roll);
  image( Apple, 30, 90 );
   
  translate(151, 231);
  rotate(roll);
  image( Apple, 80, 60 );
  
  translate(321, 111);
  rotate(roll);
  image( Apple, 30, 53 );
   
  translate(351, 111);
  rotate(roll);
  image( Apple, 350, 90 );
   
  translate(111, 61);
  rotate(roll);
  image( Apple, 30, 53 );
    
  translate(351, 251);
  rotate(roll);
  image( Apple, 33, 90 );
  
   
  translate(21, 212);
  rotate(roll);
  image( Apple, 5, 59 );
   
  translate(45, 45);
  rotate(roll);
  image( Apple, 26, 10 );
   
  translate(59, 368);
  rotate(roll);
  image( Apple, 5, 254 );
  
}
}

void keyPressed() {  //key no s wo osu
  if ( key == 's' ) {
    size(450,450);
 
colorMode(RGB, 100);
background(99);

for(int i=0; i<100; i++){
  line(random(width), random(height), random(width), random(height));
}            //random ni sen

    
  }
}



