

import java.text.NumberFormat;

int phase = 0;
String input = "";

PFont font1,font2;

double years = 1986;
String one[];

void setup(){
  size(512,600);
  one = new String[3];

  one[0] = "";
  one[1] = "";
  one[2] = "";


  font1 = loadFont("SempliceRegular-8.vlw");
  font2 = loadFont("Mocha-16.vlw");
}



void draw(){

  background(0);

      if(phase>=0)
      ask("Please enter the YEAR of your birth: ",0,-200);

      if(phase>=1)
      ask("the MONTH of birth (numerical) : ",1,-100);

      if(phase>=2)
      ask("lastly a DAY of month (numerical): ",2,0);


      if(phase>=3)
      ask("then the dimmensions of your UNIVERSE are approx.: ",3,100);

}


void carret(int Y){
  pushMatrix();
  noStroke();
  fill((sin(millis()/50.0)+1.0)*127 );
  translate(width/2+textWidth(input)/2,height/2+40-6+Y);
  rect(-1,-8,10,18);
  popMatrix();
}

void ask(String que,int ph,int Y){
  textFont(font1,8);
  fill(255);
  textAlign(CENTER);
  text(que,width/2,height/2+Y);
 
 textFont(font2,16);
  

  if(ph<=2){
  text(one[ph].equals("")?input:one[ph],width/2,height/2+40+Y);
  
  if(phase==ph)
  carret(Y);
  }else{
  
  
  NumberFormat format = NumberFormat.getInstance();
  format.setMinimumFractionDigits(0);
  format.setMaximumFractionDigits(0);
  double lightspeed = 1079252848.8*24.0*365.25;
  double vol = years+(millis()/1000.0/60.0/60.0/24.0/365.25);
  vol = vol * vol * vol * lightspeed;
  double surf = years+(millis()/1000.0/60.0/60.0/24.0/365.25);
  surf = surf * surf * lightspeed;
  double ratio = surf / vol;
  double len = (years+(millis()/1000.0/60.0/60.0/24.0/365.25))*lightspeed;

  //textAlign(RIGHT);
  text("radius = "+format.format(len)+" km",width/2,height/2+40+Y);
  text("surface = "+format.format(4.0*PI*surf)+" km\u00B2",width/2,height/2+60+Y);
  text("volume = "+format.format(4.0/3.0*PI*vol)+" km\u00B3",width/2,height/2+80+Y);
  format.setMinimumFractionDigits(10);
  text("SA:V = "+format.format(ratio)+"",width/2,height/2+130+Y);
  };
}

void keyPressed(){
  if((key>='0'&&key<='9'))
    input += key+"";//(char)(key-48)+"";

  if(keyCode==ENTER){
    switch(phase){
      case 0:
      years = year()-parseInt(input);
      one[0] = input+"";
      break;
      case 1:
      years += ((month()-parseInt(input))/12.0);
      one[1] = input+"";
      break;
      case 2:
      years += ((day()-parseInt(input))/365.0);
      one[2] = input+"";
      break;
    }
    
    if(keyCode==BACKSPACE){
      if(input.length()>=0){
        input = ""+input.substring(0,input.length()-1);
      }
    }
    
    phase ++;
    
    input = "";
  }
}

