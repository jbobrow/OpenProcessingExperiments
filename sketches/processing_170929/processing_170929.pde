
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
void setup() {
  img1 = loadImage("df.jpg");
  img2 = loadImage("1544600_10202542911207662_924162482_n-001.jpg");
  img3 = loadImage("DSC02110cc-001.jpg");
  img4 = loadImage("DSC02134(2)-001.JPG");
  img5 = loadImage("1623772_10202542910687649_795057151_n-001.jpg");
  size(700,700);
}
void draw() {
  //Punto de referencia
  imageMode(CENTER);
    image(img1, 368,325,height, width);
   //ellipse(height/2,width/2,35,35);
   
   //OJO derecho  
    imageMode(CENTER);
    image(img2, height*5/8, width/2,145,71);
    
     
   //OJO izquierdo 
    imageMode(CENTER);
    image(img4, height*3/8, width/2,145,71);
    
     //boca
    imageMode(CENTER);
    image(img3, height/2, (width*7/9)-20,570/3,226/3);
    
       //nariz
    imageMode(CENTER);
    image(img5, height/2, width*5/8,97*1.3,87*1.3);
}


