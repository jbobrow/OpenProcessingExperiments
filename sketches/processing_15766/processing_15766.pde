
//Assignment 4 Programming for CreaTe
//Creature as an object (So the same rabbit like assignment 1)
//Rabbit is bouncing
//published at http://openprocessing.org/visuals/checkVisual.php?visualID=15015

//If you want to change the number of rabbits change the number in the []
//If there are less then 20 you can see the disgust better....
Rabbit [] rabbits = new Rabbit [20];

//windowsize
int w=500;

void setup(){
  
  size(w,w);
  smooth();
  for (int i = 0; i < rabbits.length; i++) {
  rabbits[i]= new Rabbit(random(100,w-100),random(100,w-100));
    }  
  
}
void draw(){
  background(255);
  for (int i = 0; i < rabbits.length; i++) {
  
  rabbits[i].display();
  rabbits[i].jump();
 } 
 //The bouce between the rabbits
  for (int i = 0; i < rabbits.length; i++) {
    for (int j = 0; j < rabbits.length; j++) {
      float distance = dist(rabbits[i].x,rabbits[i].y,rabbits[j].x,rabbits[j].y);
      if (i!=j && distance < rabbits[i].s/3+rabbits[j].s/3) {
        float xi = rabbits[i].xspeed;
        float yi = rabbits[i].yspeed;
        
        rabbits[i].xspeed = rabbits[j].xspeed;
        rabbits[i].yspeed = rabbits[j].yspeed;
        
        rabbits[j].xspeed = xi;
        rabbits[j].yspeed = yi;
      }
    }
  } 
}

class Rabbit {
  //the rabbits variables
  color c, rabbitGrey, rabbitStroke, rabbitLgrey, rabbitLstroke, rabbitColor, rabbitCstroke, rabbitBcolor, rabbitBstroke, rabbitRcolor, rabbitRstroke;
  float a, b, x, y, xspeed, yspeed, s;


Rabbit(float tempX,float tempY) {
  //backgroundcolor
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
 x= (width/random(6));
 y= (width/random(6));
 xspeed= (random(0.5,4));
 yspeed= (random(0.5,4));
 //bigness rabbit
 s= (random(100,200));
 a= rabbitColor;
 b= rabbitCstroke;
 x= tempX;
 y= tempY;


}
void display () {

   rabbitColor=((int) a);
   rabbitCstroke=((int) b);
  
  
  
if(mousePressed==true) {
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
        ellipse(x,y+s/5.2632,s/4,s/3.6363);
     //innen
        fill((int)rabbitLgrey);
        stroke((int)rabbitLstroke);
        ellipse(x,y+s/4.4444,s/6.6666,s/5.7123);
//Kopf       
  //ohren
      //grau
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        ellipse(x-s/20,y-s/5.7143,s/13.333,s/2.5);
        ellipse(x+s/20,y-s/5.7143,s/13.333,s/2.5);
      //rosa
        fill((int)rabbitColor);
        stroke((int)rabbitCstroke);
        ellipse(x-s/20,y-s/6.6667,s/25,s/5);
        ellipse(x+s/20,y-s/6.6667,s/25,s/5);
      //Grundriss-Kopf
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        ellipse(x,y,s/5,s/5);
  //Augen
      //weiß
        fill(255,255,255,255);
        stroke(240,240,240,255);
        ellipse(x-s/25,y-s/40,s/25,s/20);
        ellipse(x+s/25,y-s/40,s/25,s/20);
      //blau  
        fill(0,164,255,255);
        stroke(0,164,255,100);
        ellipse(x-s/25,y-s/40,s/50,s/50);
        ellipse(x+s/25,y-s/40,s/50,s/50);
  //Mund
      //umriss
       fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        ellipse(x,y+s/25,s/8,s/10);
      //Zunge 
        fill((int)rabbitCstroke);
        stroke((int)rabbitColor);
        ellipse(x,y+s/20,s/40,s/20);
      //Zähne
        fill(255);
        stroke(255);
        quad(x+s/200,y+s/20,x+s/200,y+s/12.5,x+s/66.6667,y+s/12.5,x+s/66.6667,y+s/20);
        quad(x-s/200,y+s/20,x-s/200,y+s/12.5,x-s/66.6667,y+s/12.5,x-s/66.6667,y+s/20);
      //Mundwinkel
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        arc(x+s/28.5714,y+s/33.3333,s/13.3333,s/13.3333, PI/2,PI);
        arc(x-s/28.5714,y+s/33.3333,s/13.3333,s/13.3333, 0,PI/2);
      //Schnurrhaare sehen doof aus
    //Nase
        fill(60,60,60,255);
        stroke(45,45,45,255);
        triangle(x-s/66.6667,y,x+s/66.6667,y,x,y+s/33.3333);      
  //Beine
    //links
      //grau
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);
        arc(x-s/5.7143,y+s/3.6363,s/3.3333,s/8,TWO_PI-PI/2, TWO_PI);
        arc(x-s/7.6923,y+s/3.6363,s/5,s/9.5238, 0, PI/2);
        arc(x-s/8,y+s/4.4444,s/3.3333,s/5, PI/2, PI);
        arc(x-s/5.8824,y+s/4.3478,s/4.878,s/33.3333, PI, TWO_PI-PI/2);
       //rosa 
        fill((int)rabbitColor);
        stroke((int)rabbitCstroke);
        arc(x-s/8,y+s/3.6363,s/6.6667,s/12.5,TWO_PI-PI/2, TWO_PI);
        arc(x-s/10,y+s/3.6363,s/10,s/25, 0, PI/2);
        arc(x-s/10,y+s/4,s/6.6667,s/11.1111, PI/2, PI);
        arc(x-s/8,y+s/4,s/10,s/33.3333, PI, TWO_PI-PI/2);
        ellipse(x-s/4.3478,y+s/4.1667,s/16.6667,s/33.3333);
        ellipse(x-s/4.6512,y+s/3.6363,s/25,s/50);
        ellipse(x-s/5.5556,y+s/3.3898,s/33.3333,s/50);
   //rechts
      //grau    
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);   
        arc(x+s/5.8824,y+s/4.3478,s/4.8780,s/33.3333,TWO_PI-PI/2, TWO_PI);
        arc(x+s/8,y+s/4.4444,s/3.3333,s/5, 0, PI/2);
        arc(x+s/7.6923,y+s/3.6363,s/4.8780,s/10, PI/2, PI);
        arc(x+s/5.7143,y+s/3.6363,s/3.3333,s/8, PI, TWO_PI-PI/2);
     //rosa   
        fill((int)rabbitColor);
        stroke((int)rabbitCstroke);
        arc(x+s/8,y+s/4,s/10,s/33.3333,TWO_PI-PI/2, TWO_PI);
        arc(x+s/10,y+s/4,s/6.6667,s/11.1111, 0, PI/2);
        arc(x+s/10,y+s/3.6363,s/10,s/25, PI/2, PI);
        arc(x+s/8,y+s/3.6363,s/6.6667,s/12.5, PI, TWO_PI-PI/2);
        ellipse(x+s/4.3478,y+s/4.1667,s/16.6667,s/33.3333);
        ellipse(x+s/4.6512,y+s/3.6363,s/25,s/50);
        ellipse(x+s/5.5556,y+s/3.3898,s/33.3333,s/50);
//Arme
    //links
      //d.grau 
        fill((int)rabbitGrey);
        stroke((int)rabbitStroke);   
        ellipse(x-s/10,y+s/6.0606,s/13.3333,s/10);
      //h.grau  
        fill((int)rabbitLgrey);
        stroke((int)rabbitLstroke);
        ellipse(x-s/11.7647,y+s/6.0606,s/33.3333,s/13.3333);
   //rechts//  
      //d.grau
       fill((int)rabbitGrey);
        stroke((int)rabbitStroke);   
        ellipse(x+s/10,y+s/6.0606,s/13.3333,s/10);
      //h.grau  
        fill((int)rabbitLgrey);
        stroke((int)rabbitLstroke); 
       ellipse(x+s/11.7647,y+s/6.0606,s/33.3333,s/13.3333);
} 
 
 
//the move
void jump() {
 x = x + xspeed;
 if (x > width-s/4 || x< s/4) {
   xspeed = -xspeed;
 }
 y = y + yspeed;
 if (y > width-s/3 || y < s/3) {
 yspeed = - yspeed;
 }
}
}


