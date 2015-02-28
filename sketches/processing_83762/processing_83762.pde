
import processing.opengl.*;

PImage photo;
PFont font;
int total = 16;
float xprev, yprev = 0;
float lineLength;
int q =0;
int alph = 0;
PImage[] images = new PImage[3];


boolean fall = false;
boolean fade = false;
class ball{
  String info;
    float xinit;
    float yinit;
    float xpos;
    float ypos;
    float accel;
    float xland;
    float diameter;
    boolean active;
    boolean returning;
    String name_;

    public ball(){
      info = "What up";
      name_ ="hello";
      xinit=0;
      yinit=0;
      xpos = 0;
      ypos = 0;
      accel = 0;
      xland = 0;
      active = false;
      returning = false;
      diameter = 20;
    }
    public ball(float tx, float ty, String name, float xa, String inf){
      info = inf;
      name_ = name;
      xinit=tx;
      yinit=ty;
      xpos = tx;
      ypos = ty;
      accel = 0;
      xland = xa;
      active = false;
      returning = false;
      diameter = 20;
    }
    
    void update(){
      
      if(balls[8].ypos >=650 && balls[9].ypos >=650  && balls[14].ypos >=650  && balls[15].ypos >=650 && balls[10].ypos >=650){
         balls[10].returning = false;
       }
       if(balls[10].ypos >=650){
         balls[11].returning = false;
         balls[12].returning = false;
       }
       if(balls[5].ypos >=650){
         balls[6].returning = false;
       }
       if(balls[10].ypos >=650){
         balls[3].returning = false;
       }
       if(balls[3].ypos >=650 || balls[4].ypos >=650  || balls[10].ypos >=650 ){
         balls[6].returning = false;
       }
        if(balls[3].ypos >=650  || balls[10].ypos >=650 ){
         balls[4].returning = false;
       }
       if(balls[1].ypos >=650 ){
         balls[0].returning = false;
         balls[2].returning = false;
       }
       if(balls[2].ypos >=650 ){
         balls[3].returning = false;
       }
       if(balls[7].ypos >=650 ){
         balls[9].returning = false;
       }
       if(balls[13].ypos >=650 ){
         balls[14].returning = false;
       }
   
       if(balls[8].ypos <=650 && balls[9].ypos <=650  && balls[14].ypos <=650  && balls[15].ypos <=650 && fall){
         fall = false;
       }
      if(balls[8].ypos>= 690 && balls[9].ypos >= 690  && balls[14].ypos >= 690  && balls[15].ypos >= 690 && !fall){
        balls[10].active = true;
        fall = true;
        
        
          
            if(accel < 1 && accel > -1 && ypos >=690){
              accel =0;
              active = false;
              
            }
        
      }
      //if(balls[8].ypos>= 690 && balls[9].ypos >= 690  && balls[14].ypos >= 690  && balls[15].ypos >= 690 && fall){
      //balls[10].active = false;
      //fall = false;
      //}
     
      if(active && name_ == "Ethylene"){
        
      balls[11].active = true;
      balls[12].active = true;
      balls[3].active = true;
      balls[4].active = true;
      balls[6].active = true;
      
      } else if(balls[10].returning){
   
      
      balls[11].returning = true;
      balls[12].returning = true;
      balls[3].returning = true;
      balls[4].returning = true;
      balls[6].returning = true;
           
      }
      if(active && name_ == "Sugar Cane"){

      balls[9].active = true;
     
      } else if(balls[7].returning){
      
      balls[9].returning = true;
     
      }
      if(active && name_ == "Crude Oil"){
      balls[14].active = true;
     
      } else if(balls[13].returning){
      
      balls[14].returning = true;
     
      }
      if(active && name_ == "Brine"){
      balls[0].active = true;
      balls[2].active = true;
      balls[3].active = true;
      balls[4].active = true;
      balls[6].active = true;
      
      } else if(balls[1].returning){
      
      balls[0].returning = true;
      balls[2].returning = true;
      balls[3].returning = true;
      balls[4].returning = true;
      balls[6].returning = true;
      }
      if(active && name_ == "Cl2"){
     
    
      
      balls[3].active = true;
      balls[4].active = true;
      balls[6].active = true;
      
      
      
      } else if(balls[2].returning){
      
     
      balls[3].returning = true;
      balls[4].returning = true;
      balls[6].returning = true;
      
      
      }
      if(active && name_ == "HCl"){
     
      balls[6].active = true;
      
      
      
      } else if(balls[5].returning){
     
      balls[6].returning = true;
      
      
      }
      if(active && name_ == "EDC"){
      balls[4].active = true;
      balls[6].active = true;
      
      
      
      } else if(balls[3].returning){
      
      balls[4].returning = true;
      balls[6].returning = true;
      
      }
      if(active && name_ == "VCM"){
      
      balls[6].active = true;
      
      
      
      } else if(balls[4].returning){
      
      balls[6].returning = true;
      
      }
      if(active){
        accel += 1;
        ypos += accel;
        
            
        if(ypos > 690){
            accel = accel*-.7;
            if(accel < 1 && accel > -1){
              accel =0;
              active = false;
              
            }
         
           
          }
      }else if(returning){
     
       accel += -.7;
       ypos+= accel;
       xpos = xinit;
      if(ypos<= yinit){
        accel = 0;
        ypos = yinit;
        returning = false;
      
      } 
      }
    }
    
    void display(){
     strokeWeight(5);
      if(balls[4].ypos == balls[4].yinit && balls[6].ypos == balls[6].yinit){
       line(balls[4].xpos, balls[4].ypos,balls[6].xpos,balls[6].ypos);
       drawArrow(int(balls[4].xpos), int(balls[4].ypos), int(lineLength*243), 0);
       }
      if(balls[7].ypos == balls[7].yinit && balls[9].ypos == balls[9].yinit){
      //bezier(balls[7].xpos, balls[7].ypos, 100.0, 300.0, 400.0, 300.0, balls[9].xpos,balls[9].ypos);
       line(balls[7].xpos, balls[7].ypos, balls[9].xpos,balls[9].ypos);
       drawArrow(int(balls[7].xpos), int(balls[7].ypos), int(lineLength*183), 6.5);
       }
      
      if(balls[12].ypos == balls[12].yinit && balls[10].ypos == balls[10].yinit){
       line(balls[10].xpos, balls[10].ypos,balls[12].xpos,balls[12].ypos);
       drawArrow(int(balls[10].xpos), int(balls[10].ypos), int(lineLength*447), 5.5);
       }
      if(balls[8].ypos == balls[8].yinit && balls[10].ypos == balls[10].yinit){
       line(balls[8].xpos, balls[8].ypos,balls[10].xpos,balls[10].ypos);
       drawArrow(int(balls[8].xpos), int(balls[8].ypos), int(lineLength*473), -5.3);
       }
     if(balls[11].ypos == balls[11].yinit && balls[10].ypos == balls[10].yinit){
      line(balls[11].xpos, balls[11].ypos,balls[10].xpos,balls[10].ypos);
      drawArrow(int(balls[10].xpos), int(balls[10].ypos), int(lineLength*450), -9);
      }
      if(balls[10].ypos == balls[10].yinit && balls[14].ypos == balls[14].yinit ){
       line(balls[14].xpos, balls[14].ypos,width/2,600);
       drawArrow(int(balls[14].xpos),int( balls[14].ypos), int(lineLength*235), 0);
       
       }
      if(balls[13].ypos == balls[13].yinit && balls[14].ypos == balls[14].yinit ){
       line(balls[13].xpos, balls[13].ypos,balls[14].xpos,balls[14].ypos);
       drawArrow(int(balls[13].xpos), int(balls[13].ypos), int(lineLength*182), 0);
       
      }
      if(balls[15].ypos == balls[15].yinit && balls[10].ypos == balls[10].yinit ){
       line(balls[15].xpos, balls[15].ypos,width/2+130,600);
       drawArrow(int(balls[15].xpos), int(balls[15].ypos), int(lineLength*345), 180);
       
      }
      if(balls[9].ypos == balls[9].yinit && balls[10].ypos == balls[10].yinit ){
       line(balls[9].xpos, balls[9].ypos,balls[10].xpos,balls[10].ypos);
       drawArrow(int(balls[9].xpos), int(balls[9].ypos), int(lineLength*293), 10);
       
      }
      if(balls[0].ypos == balls[0].yinit && balls[1].ypos == balls[1].yinit ){
       line(balls[0].xpos, balls[0].ypos,balls[1].xpos,balls[1].ypos);
       drawArrow(int(balls[1].xpos), int(balls[1].ypos), int(lineLength*72), -90);
       
      }
      if((balls[14].ypos == balls[14].yinit || balls[15].ypos == balls[15].yinit)  && balls[10].ypos == balls[10].yinit){
       line(width/2+20,570,balls[10].xpos,balls[10].ypos);
        drawArrow(width/2+20,570, int(lineLength*138), -90);
       
      }
      if(balls[1].ypos == balls[1].yinit && balls[2].ypos == balls[2].yinit ){
       line(balls[1].xpos, balls[1].ypos,balls[2].xpos,balls[2].ypos);
       drawArrow(int(balls[1].xpos), int(balls[1].ypos), int(lineLength*182), 0);
       
      }
      if(balls[2].ypos == balls[2].yinit && balls[3].ypos == balls[3].yinit ){
       line(balls[2].xpos, balls[2].ypos,balls[3].xpos,balls[3].ypos);
       drawArrow(int(balls[2].xpos), int(balls[2].ypos), int(lineLength*333), 0);
       
      }
      if(balls[4].ypos == balls[4].yinit && balls[3].ypos == balls[3].yinit ){
       line(balls[4].xpos, balls[4].ypos,balls[3].xpos,balls[3].ypos);
       drawArrow(int(balls[3].xpos), int(balls[3].ypos), int(lineLength*158), 0);
       
      }
      if(balls[5].ypos == balls[5].yinit && balls[6].ypos == balls[6].yinit ){
       line(balls[5].xpos, balls[5].ypos,balls[6].xpos,balls[6].ypos);
       drawArrow(int(balls[5].xpos), int(balls[5].ypos), int((lineLength*150)), 28.5);
       
      }
      if(balls[10].ypos == balls[10].yinit && balls[3].ypos == balls[3].yinit ){
       line(balls[10].xpos, balls[10].ypos,balls[3].xpos,balls[3].ypos);
       drawArrow(int(balls[10].xpos), int(balls[10].ypos), int(lineLength*232), -79);
       
      }
     
      if (mouseOver()){
         fill (0,0,0);
            //image(images[1], 160, 30);
            textFont(font, 17);
            text(info, width/4, 70);
            textFont(font, 22);
            
            if((alph < 255 )){
            fill(0,0,0,alph);
            alph +=2.5;
            if(alph >= 255){
            alph = 0;
            }
         }
      }else{
          
            fill(49,79,79);
            textFont(font, 20);
      }
       if(((name_ == "Ethylene") && ypos > balls[10].yinit) || (((name_ == "Crude Oil") && ypos > balls[13].yinit)) || (((name_ == "Brine") && ypos >balls[1].yinit)) || (((name_ == "Sugar Cane") && ypos >balls[7].yinit))){
       fill(255, 0, 0);
       
       }
       
      text(name_, xpos-(9*name_.length())-9, ypos-19);
      //println(name_.length());
      ellipse(xpos,ypos, diameter,diameter);
      fill(49,79,79);
     stroke(49,79,79);
        rect(float(width/2-40), float(570), float(170), float(70), 8.0);
      fill(0,0,0);
      textFont(font, 20);
      text("Cracking", width/2, 610);
      
      
    }
    
    boolean mouseOver(){
      if(sqrt(sq(xpos - mouseX) + sq(ypos - mouseY)) < diameter/2 ) {
        return true;
      } else {
        return false;
      } 
    }
    
}

ball[] balls;

void setup(){
  // Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //println(fontList);
  font = createFont("Helvetica", 20);
  smooth();
  size(1118, 800, OPENGL);
 // font = loadFont("Batang-36.vlw");
/*
for ( int i = 0; i< images.length; i++ )
{
images[i] = loadImage( i + ".png" );   // make sure images "0.jpg" to "11.jpg" exist
}*/
  balls = new ball[total];
  balls[0] = new ball(108,130, "NaOH", ((width/16)-30), "Sodium Hydroxide is a strong base used in the manufacture of   \n    paper, textiles, soaps and other chemicals.");
  balls[1] = new ball(108,202,"Brine", (((width/16)*2)-30), "Brine is a solution of salt (usually sodium chloride) in water.");
  balls[2] = new ball(290,202,"Cl2", (((width/16)*3)-30), "Chlorine gas has the highest electron affinity and the third \n    highest electronegativity of all the elements; for this reason, \n     chlorine is a strong oxidizing agent. ");
  balls[3] = new ball(623,202,"EDC", (((width/16)*4)-30), "EDC (1-ethyl-3-(3-dimethylaminopropyl)carbodiimide) is a water\n   soluble carbodiimide usually obtained as the hydrochloride. ");
  balls[4] = new ball(781,202,"VCM", (((width/16)*5)-30), "Vinyl chloride is the organochloride with the formula H2C:CHCl.\n    It is also called vinyl chloride monomer, VCM or chloroethene.");
  balls[5] = new ball(892,130,"HCl",(((width/16)*6)-30), "Hydrochloric acid is a clear, colourless solution of hydrogen\n    chloride (HCl) in water. It is a highly corrosive, strong mineral\n    acid with many industrial uses.");
  balls[6] = new ball(1024,202,"PVC", (((width/16)*7)-30), "Polyvinyl chloride, commonly abbreviated PVC, is the       \n    third-most widely produced plastic, after polyethylene and polypropylene.");
  balls[7] = new ball(108,360,"Sugar Cane",(((width/16)*8)-30), "Native to the warm temperate to tropical regions of   \n    South Asia, they have stout jointed fibrous stalks that are rich \n    in sugar, and measure two to six metres tall. All sugar cane species \n    interbreed, and the major commercial cultivars are complex hybrids.");
  balls[8] = new ball(108,473,"Algae", (((width/16)*9)-30), "Algae are a very large and diverse group of simple,       \n    typically autotrophic organisms, ranging from unicellular to     \n    multicellular forms, such as the giant kelps that grow to 65 meters in\n     length.");
  balls[9] = new ball(290,380,"etOH", (((width/16)*10)-30), "Ethanol, also called ethyl alcohol, pure alcohol, grain   \n    alcohol, is a volatile, flammable, colorless liquid.");
  balls[10] = new ball(width/2+20,height/2+30,"Ethylene", (((width/16)*11)-30), "Ethylene (IUPAC name: ethene) is an   \n organic compound, a hydrocarbon with the formula C2H4 or H2C=CH2.");
  balls[11] = new ball(1024,360,"LDPE",(((width/16)*12)-30), "Low-density polyethylene (LDPE) is a thermoplastic made  \n    from the monomer ethylene. In 2009 the worldwide LDPE market     \n    reached a volume of US$22.2 billion. ");
  balls[12] = new ball(1024,473,"HDPE", (((width/16)*13)-30), "High-density polyethylene (HDPE) or polyethylene high-density \n    (PEHD) is a polyethylene thermoplastic made from petroleum.\n    It takes 1.75 kilograms of petroleum to make one kilogram of HDPE.");
  balls[13] = new ball(108,600,"Crude Oil", (((width/16)*14)-30), "Crude oil is a naturally occurring flammable liquid consisting\n     of a complex mixture of hydrocarbons of various molecular\n      weights and other liquid organic compounds geologic formations \n      beneath the Earth's surface. ");
  balls[14] = new ball(290,600,"Naphtha", (((width/16)*15)-30), "Naphtha is a component of natural gas condensate or a distillation\n      product from petroleum, coal tar or peat boiling\n      in a certain range and containing certain hydrocarbons.");
  balls[15] = new ball(1024,600,"Natural Gas", (((width/16)*16)-30), "Natural gas is a naturally occurring hydrocarbon gas mixture \n      consisting primarily of methane, with other hydrocarbons,\n       carbon dioxide, nitrogen and hydrogen sulfide.");
 
 
}

void draw() {
  background(245,255, 250);
  
  for(int i=0;i<total;i++){
    
    q = i;
   balls[i].update();
    balls[i].display(); 

    
    if(balls[i].ypos > 680 ){
    balls[i].ypos = 690;
    balls[i].xpos = balls[i].xland;
    
    
    }
    
    lineLength +=.0003;
   if(lineLength> 1){
   lineLength = 0;
   }
  }
}

void mousePressed(){
  for(int i=0; i < 16; i++){
    if(balls[i].mouseOver()){
      if(balls[i].yinit == balls[i].ypos)
        balls[i].active = true;
       else
         balls[i].returning = true;
    }
  }
}

void drawArrow(int cx, int cy, int len, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}



