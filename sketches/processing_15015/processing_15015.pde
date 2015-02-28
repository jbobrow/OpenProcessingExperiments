
//Assignment 3 Programming for CreaTe
//Creature as an object (So the same rabbit like assignment 1)
//Rabbit is bouncing
//published at http://openprocessing.org/visuals/checkVisual.php?visualID=14607

Rabbit myRabbit;
int s= 200;
void setup(){
  size(s,s);
  smooth();
  myRabbit= new Rabbit();
}
void draw(){
background(255);
myRabbit.jump();
myRabbit.display();
} 

class Rabbit {
  color c;
color rabbitGrey;
color rabbitStroke;
color rabbitLgrey;
color rabbitLstroke;
color rabbitColor;
color rabbitCstroke;
color rabbitBcolor;
color rabbitBstroke;
color rabbitRcolor;
color rabbitRstroke;
float a;
float b;
float xpos;
float ypos;
float xspeed;
float yspeed;
float bigness;


Rabbit() {
  c= (255);
 //dark grey and it`s stroke
 rabbitGrey= color ((int)180,(int)180,(int)180,(int)255);
 rabbitStroke= color ((int)150,(int)150,(int)150,(int)255);
//light grey and it`s stroke
 rabbitLgrey= color ((int)195,(int)195,(int)195,(int)255);
 rabbitLstroke= color ((int)180,(int)180,(int)180,(int)255);
//rabbit`s color for example pink
 rabbitColor= color ((int)255,(int)168,(int)220,(int)255);
 rabbitCstroke= color ((int)240,(int)138,(int)199,(int)255);
//if mouse pressed: rabbit`s color
 rabbitBcolor= color ((int)0,(int)74,(int)255,(int)255);
 rabbitBstroke= color ((int)17,(int)39,(int)93,(int)130);
//if key pressed: rabbit`s color
 rabbitRcolor= color ((int)255,(int)0,(int)0,(int)255);
 rabbitRstroke= color ((int)255,(int)0,(int)23,(int)130); 
 xpos= (width/2);
 ypos= (width/2);
 xspeed= (random(3));
 yspeed= (random(3));
 bigness= (random(s));
 a= rabbitColor;
 b= rabbitCstroke;

}
void display () {
   background(c);
  rabbitColor=((int) a);
  rabbitCstroke=((int) b);
  
  
  
if(mousePressed) {
   //blau 
   rabbitColor= rabbitBcolor;
   rabbitCstroke= rabbitBstroke;
}
  
if(keyPressed) {
  rabbitColor= rabbitRcolor;
  rabbitCstroke= rabbitRstroke;
} 

 //Hase Normal
 //Körper
     //außen
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        ellipse(xpos,ypos+bigness/5.2632,bigness/4,bigness/3.6363);
     //innen
        fill((int)rabbitLgrey);
        stroke((int)rabbitLstroke);
        ellipse(xpos,ypos+bigness/4.4444,bigness/6.6666,bigness/5.7123);
//Kopf       
  //ohren
      //grau
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        ellipse(xpos-bigness/20,ypos-bigness/5.7143,bigness/13.333,bigness/2.5);
        ellipse(xpos+bigness/20,ypos-bigness/5.7143,bigness/13.333,bigness/2.5);
      //rosa
        fill((int)rabbitColor);
        stroke((int)rabbitCstroke);
        ellipse(xpos-bigness/20,ypos-bigness/6.6667,bigness/25,bigness/5);
        ellipse(xpos+bigness/20,ypos-bigness/6.6667,bigness/25,bigness/5);
      //Grundriss-Kopf
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        ellipse(xpos,ypos,bigness/5,bigness/5);
  //Augen
      //weiß
        fill(255,255,255,255);
        stroke(240,240,240,255);
        ellipse(xpos-bigness/25,ypos-bigness/40,bigness/25,bigness/20);
        ellipse(xpos+bigness/25,ypos-bigness/40,bigness/25,bigness/20);
      //blau  
        fill(0,164,255,255);
        stroke(0,164,255,100);
        ellipse(xpos-bigness/25,ypos-bigness/40,bigness/50,bigness/50);
        ellipse(xpos+bigness/25,ypos-bigness/40,bigness/50,bigness/50);
  //Mund
      //umriss
       fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        ellipse(xpos,ypos+bigness/25,bigness/8,bigness/10);
      //Zunge 
        fill((int)rabbitCstroke);
        stroke((int)rabbitColor);
        ellipse(xpos,ypos+bigness/20,bigness/40,bigness/20);
      //Zähne
        fill(255);
        stroke(255);
        quad(xpos+bigness/200,ypos+bigness/20,xpos+bigness/200,ypos+bigness/12.5,xpos+bigness/66.6667,ypos+bigness/12.5,xpos+bigness/66.6667,ypos+bigness/20);
        quad(xpos-bigness/200,ypos+bigness/20,xpos-bigness/200,ypos+bigness/12.5,xpos-bigness/66.6667,ypos+bigness/12.5,xpos-bigness/66.6667,ypos+bigness/20);
      //Mundwinkel
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        arc(xpos+bigness/28.5714,ypos+bigness/33.3333,bigness/13.3333,bigness/13.3333, PI/2,PI);
        arc(xpos-bigness/28.5714,ypos+bigness/33.3333,bigness/13.3333,bigness/13.3333, 0,PI/2);
      //Schnurrhaare sehen doof aus
    //Nase
        fill(60,60,60,255);
        stroke(45,45,45,255);
        triangle(xpos-bigness/66.6667,ypos,xpos+bigness/66.6667,ypos,xpos,ypos+bigness/33.3333);      
  //Beine
    //links
      //grau
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        arc(xpos-bigness/5.7143,ypos+bigness/3.6363,bigness/3.3333,bigness/8,TWO_PI-PI/2, TWO_PI);
        arc(xpos-bigness/7.6923,ypos+bigness/3.6363,bigness/5,bigness/9.5238, 0, PI/2);
        arc(xpos-bigness/8,ypos+bigness/4.4444,bigness/3.3333,bigness/5, PI/2, PI);
        arc(xpos-bigness/5.8824,ypos+bigness/4.3478,bigness/4.878,bigness/33.3333, PI, TWO_PI-PI/2);
       //rosa 
        fill((int)rabbitColor);
        stroke((int)rabbitCstroke);
        arc(xpos-bigness/8,ypos+bigness/3.6363,bigness/6.6667,bigness/12.5,TWO_PI-PI/2, TWO_PI);
        arc(xpos-bigness/10,ypos+bigness/3.6363,bigness/10,bigness/25, 0, PI/2);
        arc(xpos-bigness/10,ypos+bigness/4,bigness/6.6667,bigness/11.1111, PI/2, PI);
        arc(xpos-bigness/8,ypos+bigness/4,bigness/10,bigness/33.3333, PI, TWO_PI-PI/2);
        ellipse(xpos-bigness/4.3478,ypos+bigness/4.1667,bigness/16.6667,bigness/33.3333);
        ellipse(xpos-bigness/4.6512,ypos+bigness/3.6363,bigness/25,bigness/50);
        ellipse(xpos-bigness/5.5556,ypos+bigness/3.3898,bigness/33.3333,bigness/50);
   //rechts
      //grau    
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);   
        arc(xpos+bigness/5.8824,ypos+bigness/4.3478,bigness/4.8780,bigness/33.3333,TWO_PI-PI/2, TWO_PI);
        arc(xpos+bigness/8,ypos+bigness/4.4444,bigness/3.3333,bigness/5, 0, PI/2);
        arc(xpos+bigness/7.6923,ypos+bigness/3.6363,bigness/4.8780,bigness/10, PI/2, PI);
        arc(xpos+bigness/5.7143,ypos+bigness/3.6363,bigness/3.3333,bigness/8, PI, TWO_PI-PI/2);
     //rosa   
        fill((int)rabbitColor);
        stroke((int)rabbitCstroke);
        arc(xpos+bigness/8,ypos+bigness/4,bigness/10,bigness/33.3333,TWO_PI-PI/2, TWO_PI);
        arc(xpos+bigness/10,ypos+bigness/4,bigness/6.6667,bigness/11.1111, 0, PI/2);
        arc(xpos+bigness/10,ypos+bigness/3.6363,bigness/10,bigness/25, PI/2, PI);
        arc(xpos+bigness/8,ypos+bigness/3.6363,bigness/6.6667,bigness/12.5, PI, TWO_PI-PI/2);
        ellipse(xpos+bigness/4.3478,ypos+bigness/4.1667,bigness/16.6667,bigness/33.3333);
        ellipse(xpos+bigness/4.6512,ypos+bigness/3.6363,bigness/25,bigness/50);
        ellipse(xpos+bigness/5.5556,ypos+bigness/3.3898,bigness/33.3333,bigness/50);
//Arme
    //links
      //d.grau 
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);   
        ellipse(xpos-bigness/10,ypos+bigness/6.0606,bigness/13.3333,bigness/10);
      //h.grau  
        fill((int)rabbitLgrey);
        stroke((int)rabbitLstroke);
        ellipse(xpos-bigness/11.7647,ypos+bigness/6.0606,bigness/33.3333,bigness/13.3333);
   //rechts//  
      //d.grau
       fill((int)rabbitGrey);
        stroke((int)rabbitStroke);   
        ellipse(xpos+bigness/10,ypos+bigness/6.0606,bigness/13.3333,bigness/10);
      //h.grau  
        fill((int)rabbitLgrey);
        stroke((int)rabbitLstroke); 
       ellipse(xpos+bigness/11.7647,ypos+bigness/6.0606,bigness/33.3333,bigness/13.3333);
} 
 


void jump() {
 xpos = xpos + xspeed;
 if (xpos > width-bigness/4 || xpos< bigness/4) {
   xspeed = -xspeed;
 }
 ypos = ypos + yspeed;
 if (ypos > width-bigness/3 || ypos < bigness/3) {
 yspeed = - yspeed;
 }
}
}


