
int i = 0;
int cX;
int cY;
int s=0, ants=0,ms=0, antms=0, radius=0;
int aux=0;
int radioMinutos = 90;
int radioHoras = 140;
float pi4 = PI+PI/2.0;

void setup() {  
    size(400, 600); 
    frameRate(30);
    background(0);
    cX = width/2;
    cY = height/2-60;   
    textAlign(CENTER, CENTER); 
} 

void draw() {  
  background(0);
  int h= hour();
  s = second();
  //Day
  textFont(createFont("Georgia",26));
  String date="";
  int ddat = day();
  int mdat = month();
  switch (mdat){
    case 1:
      date = "January"; 
      break;
    case 2:
      date = "February";
      break;
    case 3:
      date = "March";
      break;
    case 4:
      date = "April";
      break;
    case 5:
      date = "May";
      break;
    case 6:
      date = "June";
      break;
    case 7:
      date = "July";
      break;
    case 8:
      date = "August";
      break;
    case 9:
      date = "September";
      break;
    case 10:
      date = "October";
      break;
    case 11:
      date = "November";
      break;
    case 12:
      date = "December";
  }
  date += " " + ddat + ",\n";
  if(hour()<10){
   date +="0";
  }
  date+= hour() +  ":";
  if(minute()<10){
   date+="0";
  }
  date+=minute()+":";
  if(second()<10){
    date+="0";
  }
  date+= second();
  text(date, cX, 500);

  //HORAS
  
  
  
  //Ok, I cannot export the code into an applet, and
  //the web editor erases the modulus operator, so...
  //float ghs = (30*h-15)`;
  //float ghe = (30*h+15)`;
  float dividendo, divisor, cociente, resto, haux;
  if(h < 1){
      haux = 0.3;
  } else {
      haux = h;
  }
  float gh = 30*haux*PI/180;
  dividendo = (30*haux-15);
  divisor = 60;
  cociente = ((int)(dividendo/divisor));
  resto = dividendo - divisor*cociente;
  float ghs = resto;
  
  dividendo = (30*haux+15);
  cociente = ((int)(dividendo/divisor));
  resto = dividendo - divisor*cociente;
  float ghe = resto;
  
  int posXh = (int)(radioHoras*cos(gh+pi4))+cX;
  int posYh = (int)(radioHoras*sin(gh+pi4))+cY;
  
  ghs = PI*ghs/180.0;
  ghe = PI*ghe/180.0;
  
  fill(104,34,139);
  arc(cX,cY,120,120, 0, 2*PI);
  fill(0);
  ellipse(cX,cY,105,105);

  fill(104,34,139);
  arc(cX,cY,150,150,ghs+pi4,ghe+pi4);
  fill(0);
  arc(cX,cY,150,150,ghe+pi4,2*PI+pi4);
  ellipse(cX,cY,105,105);
  fill(255);
  textFont(createFont("Georgia",17));
  text(h,posXh,posYh); 

  
  //SEGUNDOS 

  
    ellipseMode(RADIUS);
    
    
    ms = millis();
      
    fill(255,0,0);
    arc(cX, cY, 60,60, 0+pi4, ((2*PI)/60)*s+pi4);
    fill(0);
    ellipse(cX,cY,25,25);
   
    if(s!=ants){
      ants = s;
      radius = 0;

    } else {
       //radius = (int)((ms - antms)*0.7);
       radius += pow(2,(ms-antms)/30.0);
       antms = ms; 
    }
    fill(0); 
    ellipse(cX,cY,radius,radius);
    fill(255);
    textFont(createFont("Georgia",24));
    text(s,cX,cY);

    //MINUTOS  
    int xmin;
    int ymin;
    int m;
    
    float mMax = minute();
    for(m = 0; m <= mMax; m++){
      xmin = ((int)(radioMinutos*cos((((180.0/30.0)*m)*PI)/180.0+pi4)));
      ymin = ((int)(radioMinutos*sin((((180.0/30.0)*m)*PI)/180.0+pi4)));
      if(mMax == m){
         fill(255,0,0); 
      } else {
        fill(255);
      }
      ellipse(xmin+cX,ymin+cY,3 ,3);
      if(m == mMax){
        fill(255);
        textFont(createFont("Georgia",16));
        if(xmin<0 && ymin<0){
          text((int)mMax,xmin+cX+12,ymin+cY+12);
        } else if (xmin>0 && ymin<0){
          text((int)mMax,xmin+cX-12,ymin+cY+12);
        } else if (xmin<0 && ymin>0){
          text((int)mMax,xmin+cX+12,ymin+cY-12);
        } else {//if (xmin>0 && ymin>0){
          text((int)mMax,xmin+cX-12,ymin+cY-12);
        } 
      }
    }
}
