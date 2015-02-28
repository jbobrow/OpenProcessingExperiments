
PImage pinkcrystal;
PImage bluecrystal;
int hpc = 375;
int vpc = 250;
int pcs = 250;

int hbc = 125;
int vbc = 250;
int bcs = 250;

void setup() {
  
  size(500,500);
  smooth();
  

  bluecrystal = loadImage("crystal.png");
  pinkcrystal = loadImage("crystal2.png");
}


void draw() {

imageMode(CENTER);
 background(255); 
 
 image(pinkcrystal, hpc,vpc,pcs,pcs);
 
 image(bluecrystal, hbc,vbc,bcs,bcs);
  
   
  if(isOverImage((hpc), (vpc), (pcs/(pinkcrystal.width+0.0)) ,pinkcrystal,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == LEFT))
   {
    hpc = hpc + (mouseX - pmouseX);
    vpc = vpc + (mouseY - pmouseY);
    
  }
  
    if(isOverImage((hbc), (vbc), (bcs/(bluecrystal.width+0.0)),  bluecrystal,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == LEFT))
   {
    hbc = hbc + (mouseX - pmouseX);
    vbc = vbc + (mouseY - pmouseY);
    
  }
  
  if(isOverImage((hpc),(vpc),(pcs/(pinkcrystal.width+0.0)), pinkcrystal,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == RIGHT))
   {
    pcs = pcs + 2*(mouseX-pmouseX);
    pcs = pcs + 2*(mouseY-pmouseY);
  }
  
  
    if(isOverImage((hbc),(vbc),(bcs/(bluecrystal.width+0.0)), bluecrystal,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == RIGHT))
   {
    bcs = bcs + 2*(mouseX-pmouseX);
    bcs = bcs + 2*(mouseY-pmouseY);
  }
  

  
}







boolean isOverImage(int imgX, int imgY, float scaleIn, PImage img, int x, int y, int tolerance) {
  
  try{

    img.loadPixels();
  
    int posX = (int)(((x - imgX)*(1/scaleIn) + img.width/2));
    int posY = (int)(((y - imgY)*(1/scaleIn) + img.height/2));
  
    println(posX);
    println(posY);
    if(posX < 0 || posX > img.width || posY < 0 || posY > img.height)
      return false;
    else {
      int i = posY*img.width+posX;
     println(alpha(img.pixels[i]));
  
  
      if(alpha(img.pixels[i]) > tolerance) {
        return true;
      }
      else {
        return false;
      }
    }
  }
  catch(Exception e ){println("a horrible thing just happened");return false;}
}


