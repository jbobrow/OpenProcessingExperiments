
    rainDrop rain1;
    Sun sun;
    Cloud rainCloud;
    int x;
    int y;                //I decided to initialize some global variable, just because I found out that it was easier to manipulate them from everywhere. Not too sure that 
    int z;                //it's a good thing to do!
    
    color cloud_color;              
    color rain_color;
    color sun_color;          
    int i=0;              //counter variable
    boolean swi=false;    //bolean variables used to jump from a condition to another
    boolean swi2=false;
    
    void setup() {
        size(600,600);
        background(x, y, z);
        frameRate(40);
        
        rain1 = new rainDrop();  //creating the Instance of the classes
        rainCloud = new Cloud();
        sun= new Sun();
    }
     
    void draw() {
      
       rain1.fall();
       rain1.display();
       rainCloud.display(); 
       
       if (i>=7){                           //This is basically all the logic which counts the drops and change the background while the sun is displayed.     
         cloud_color=color(255, 255, 255, 0);
         rain_color=color(255, 255, 255, 0);
         
         background(0,x,y);
         if(!swi){
         y=y+1;
         z=z+1;
         }
         if(y>=100 || z>=100){
        sun.display();
        }
        if( y==255 || z==255) {
        swi=true;
        }
        if(swi==true){
          y=y-1;
          z=z-1;
        }
        if(swi==true && y==0 ||z==0){
          i=0;
          swi=false;
          rain_color = color(40, 40, 225);
          cloud_color = color(200);
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
//Set up of the Sun class
class Sun {
 
  float xpos;
  float ypos;
  
  boolean swi=false;
  boolean swi2=false;
  Sun(){
        sun_color= color(250, 243, 18);
        xpos= 150;
        ypos= 150;
  }
//method which display the sun
  void display(){
    fill(sun_color);
    ellipse(xpos, ypos, 100,100); 
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
             i=i+1; //this little variable increment the number of drops
          }
          }
    }


