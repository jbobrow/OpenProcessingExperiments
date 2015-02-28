
Random r;






void setup() {
  size(600,600);
  background(0);

  smooth();
  
  
  r = new Random();
}

void draw() {
  //create an alpha blended background
  fill(0,10);

//ellipse(0,0,width,height);
  
  //translate(width/2, height/2);
 
  //define standard deviation and mean
  float sd = 75; 
  float mean = width/2;

  float xloc = (float) r.nextGaussian();
  float yloc = (float) r.nextGaussian();

  xloc = ( xloc * sd ) + mean;
  yloc = ( yloc * sd ) + mean;


 
 
  stroke(0,0,random(200,255),90); //blue links boven
  point(xloc-15,yloc-15);
  
  
   stroke(random(255),0,0,90); //red rechts onder
  point(xloc+15, yloc+15);
    
    
     stroke(random(200,255),random(200,255),0,90); //yellow rechts boven
//  point(xloc+15, yloc-15);
     
     
     stroke(random(0,34),random(100,139),34,90);//green rechts boven
//  point(xloc-15, yloc+15);
  
   stroke(random(90,105),random(230,255),51,90); //light green midden boven
//   point(xloc, yloc-15);
   
    stroke(random(90,105),random(5),51,90); //purple midden onder 102.0.51
 //  point(xloc, yloc+15);
   
   stroke(random(200,244),random(5),51,112); //magentha rechts midden 224.0.112
//   point(xloc+15, yloc);
   
   stroke(random(200,244),random(5),112,90); //light blue links midden 224.0.112
 //  point(xloc+15, yloc);
   
   stroke(random(255),random(255),random(255)); //all
  point(xloc, yloc);
}




//void keyPressed(){
//  println("saved file");
//  save("img/image"+year()+month()+day()+hour()+minute()+second()+".jpg");
//}

