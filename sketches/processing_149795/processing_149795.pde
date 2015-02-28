
/* @pjs font="Oswald-Bold.ttf"; */
/* @pjs font="Oswald-Light.ttf"; */
/* @pjs font="Oswald-Regular.ttf"; */
/* @pjs font="ShadowsIntoLight.ttf"; */
int pop,s, t,y,j,x,i,y1,x1,counter = 0;
PFont oswaldBold, oswaldReg, oswaldLight, shadows;
void setup(){
  size(700,700);
  oswaldBold = createFont("Oswald-Bold",32);
  oswaldLight = createFont("Oswald-Light",32);
  oswaldReg = createFont("Oswald-Regular",32);
  shadows = createFont("ShadowsIntoLight",32);
}

void draw(){
  background(0);
  textFont(shadows,38);
  if(pop>180){
  if(y<=170){y++;}
  else{i++;}}
  if(pop>900){
    text("Mature",x,250);
    text("Prudent",x,550);
    x++;
  }
  text("Level Headed",100,y);
  pop++;
  textFont(oswaldReg,34);
    if (pop>=20){
      text("Life",100,200+i);
    }
       
    if (pop>=40) {
      text("is",160,200+i);
    }
       
    if (pop>=60) {
      textFont(oswaldBold,40);
      text("NOT",190,200+i);
      textFont(oswaldReg,34);
    }
       
    if (pop>=80) {
      text("a",275,200+i);
    }
     
    if (pop>=100) {
      text("box",300,200+i);
    }
    
    if (pop>=120) {
      text("of",365,200+i);
    }
    
    if (pop>=140) {
      text("chocolates!",400,200+i);
    }
    if(pop>900){
      textSize(random(25,44));
      text("Caution",350,300);
      text("Crazyy!!",450,y1);
      text("Impatient",700-x1,350);
      textSize(s);
      text("Ahhhhhh",x1,400);
      x1++;
      y1++;
      if(s==50){
        s=0;}
        else{s++;}
      textSize(33);
      translate(width/4,height/1.5);
      rotate(t);                          
      text("World is spinning",0,0);           
      t += 0.05; 
    }
    counter++;
    if(counter>=1500){
      textSize(50);
      text("OMG",150,450);
    }
}


