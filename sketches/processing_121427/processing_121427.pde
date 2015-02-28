
int y= 400;
int x = 0;
//variable per a alternar el color de les linies
int alternar = 1;

float aleatori = random(100,250)-(mouseY-200);
boolean boto = false;
float red = random(1,255);
float green = random(1,255);
float blue = random(1,255);
int sliderred = 0;
int slidergreen = 0;
int sliderblue = 0;

void setup(){
size(600,400);
frameRate(10);
}

void draw(){
  background(130);
  sliderred = (int)red+42;
  slidergreen = (int)green+42;
  sliderblue = (int)blue+42;
  
  if(mousePressed==true&&mouseX>0&&mouseX<40&&mouseY>383){
    boto = true;
  }

//Escala massiva. "Mentres x sigui menor a 600" = es repetira fins a que s'arribi a la dreta de la pantalla
  while(x<600){
    //"mentres y sigui major o igual que 0 i y sigui major que aleatori" = mentres Y no es passi de la part superior de la pantalla, 
    //i Y sigui major que aleatori (per a que fagi linies d'adalt a abaix fins a que s'arribi al maxim de cada barra, declarat en aquesta variable "aleatori")
    while(y>=0 && y>aleatori){
      if((alternar%2)==0){
         strokeWeight(3);
         stroke (red,green,blue);
         y -= 1;
      }
      else{
       strokeWeight(1);
        stroke(255,255,255);
      }
        line(x,y,x+10,y);   
        alternar = alternar+1;
        y -= 1;
    }
    strokeWeight(1);
    //Si pulses el requadre que posa mouseY pot moure les barres cap abaix i cap avall
    if(boto==true){
    aleatori = random (100,250)+(mouseY-200);
    }else{
    aleatori = random (100,250);    
    }
    //reinicialitzaciÃ³ de la variable y i augment de 12 a la x per poder fer la seguent barra
    y = 400;
    x = x+12;
  }
  
  x = 0;
  y = 400;
  fill(255,255,255);
  stroke(0,0,0);
  rect (0,383,40,16);
  fill(0,0,0);
  textSize(9);
  text("mouseY",3,393);
  
  //Slides, per a poder cambiar el color de les barres. Al moure la posiciÃ³ de cada slide, canvies el color.
  
  if(mousePressed == true && mouseX>584 &&mouseX<596 && mouseY>sliderred-20 && mouseY<sliderred+20 && mouseY>=40 && mouseY<=300){
    sliderred = mouseY;
    red = sliderred-42;
  } 
   if(mousePressed == true && mouseX>583 &&mouseX<599 && mouseY>9 && mouseY<25){
    sliderred = 40;
    red = 1;
  } 
  
  if(mousePressed == true && mouseX>564 &&mouseX<576 && mouseY>slidergreen-20 && mouseY<slidergreen+20 && mouseY>=40 && mouseY<=300){
    slidergreen = mouseY;
    green = slidergreen-42;    
  } 
  if(mousePressed == true && mouseX>564 &&mouseX<582 && mouseY>9 && mouseY<25){
    slidergreen = 40;
    green = 1;
  } 
  
  if(mousePressed == true && mouseX>544 &&mouseX<556 && mouseY>sliderblue-20 && mouseY<sliderblue+20 && mouseY>=40 && mouseY<=300){
    sliderblue = mouseY;
    blue = sliderblue-42;    
  } 
  if(mousePressed == true && mouseX>544 &&mouseX<563 && mouseY>9 && mouseY<25){
    sliderblue = 40;
    blue = 1;
  } 
  
  if(mousePressed == true && mouseX>548 &&mouseX<593 && mouseY>318 && mouseY<363){
    red = random(1,255);
    green = random(1,255);
    blue = random(1,255);
  }
  //quadrats que formen la zona dels slides, i el text
  fill(255,255,255);
  rect(541,7,58,330);
  fill(0,0,0);
  rect(584,30,12,285);
  rect(564,30,12,285);
  rect(544,30,12,285);
  fill(255,255,255);
  rect(585,sliderred-5,10,10);
  rect(565,slidergreen-5,10,10);
  rect(545,sliderblue-5,10,10);
  rect(548,318,45,15);  
  fill(0,0,0);
  textSize(9);
  text("R",547,20);
  fill(0,0,0);
  text("G",567,20);
  fill(0,0,0);
  text("B",587,20);
  text("Random",553,328);
  
 
}
