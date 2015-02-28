
    rainDrop rain1;
    Cloud rainCloud;
    Bucket bucket;
    int x;
    int y;                //Global variables
    int z;  
    int water;            //water variables
    int water2;
    int water3;
    boolean test=false;   //boolean variables used to control the flood
    boolean test2=false;
             
    color cloud_color;             
    color rain_color;        
                     
     
    void setup() {
        size(600,600);
        background(x, y, z);
        frameRate(40);
         
        rain1 = new rainDrop();  //creating the Instance of the classes
        rainCloud = new Cloud();
        bucket= new Bucket();
        
    }
      
    void draw() {
       
       rain1.fall();
       rain1.display();
       rainCloud.display();
       bucket.display();
         
         if(test2==true && water3>200) {  //Condition for the fish
            water2=0;
            water3=0;
            water=0;
            test2=false;
            test=false;
             
      }
    }

         
  
    



class Bucket { //Class Bucket
  
float xpos;
float ypos;

Bucket() {
  xpos = mouseX;
  ypos = 600;
}
//bucket display method
void display(){
stroke(255,255,0);
strokeWeight(10);
line(mouseX-50, 595, mouseX+50,595);  //bottom line

line(mouseX-50,600, mouseX-50,500);   //left line
line(mouseX+50,600,mouseX+50,500);   //right line
noStroke();
fill(rain_color);

if(water<100){                      //logic which set the increment of water and the contidions
rect(mouseX-45,595,90,-water);
}
 if(water>100) {
   rect(mouseX-45,595,90,-100); //bucket filled
   test=true;
  rect(0,600,mouseX-55,-water2);  //left rect water
  rect(mouseX+55,600,600,-water2); //right rect
}
if(water2>100) {
  test2=true;
  
  rect(mouseX-45,595,90,-100);   //bucketfilled
  rect(0,600,mouseX-55,-100);   //left rect water
  rect(mouseX+55,600,600,-100); //right rect
  rect(0,495,600,-water3);

}
}
}
// Set up class for cloud.
class Cloud {
     
    float xpos;
    float ypos;
    
    Cloud() {
       cloud_color = color(200);
       xpos = width/2;
       ypos = height/5;
    }
// Method which display the cloud
    void display() {      
       fill(cloud_color);
       ellipse(xpos, ypos, 150, 150);
       ellipse(xpos-100, ypos+30, 90, 90);
       ellipse(xpos+100, ypos+15, 120, 120);
       rect(xpos-100, ypos, 200, 75);
    }
}

 // Set up the class for the rain drop.
    class rainDrop {
        
        float xpos;
        float ypos;
        float yspeed;
        float dropSize;
        
        
           rainDrop() {
           rain_color = color(40, 40, 225);
           xpos = random(200, 400);
           ypos = 200;
           yspeed = 5;
           dropSize = .3;
        }
 //method that displays the raindrop       
     public void display() {
          background(0);
          noStroke();
          fill(rain_color);
          ellipse(xpos, ypos, dropSize*107, dropSize*105);
          triangle(xpos-dropSize*50, ypos-dropSize*20, xpos+dropSize*50, ypos-dropSize*20, xpos, ypos-dropSize*100);    
      }
//method that make the drop to fall     
      void fall() {
          ypos = ypos + yspeed;
          if (ypos > height+40){
             ypos = 200;
             xpos = random(200, 400);
          }
          
             if (ypos>height && xpos>mouseX-50 && xpos <mouseX+50){
             water= water+1;
             }
             if(test==true && ypos >height) {
             water2=water2+1;        
             }
             if(test2==true && ypos > height) {
             water3++;
             }
      }
    }


