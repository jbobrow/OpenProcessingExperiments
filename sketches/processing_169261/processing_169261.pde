
PImage Chrome, firefox, IE, Safari, desktop;

float chromeX = random(275-25, 275+25);
float chromeY = random(150-25, 150+25);
float chromeXspeed = 4.0, chromeYspeed = 4.0;
int chromeXflip = 1, chromeYflip = 1;

float firefoxX = random(350-20, 350+20);
float firefoxY = random(300-20, 300+20);
float firefoxXspeed = 3.0, firefoxYspeed = 3.5;
int firefoxXflip = 1, firefoxYflip = 1;

float IEX = random(100-10, 100+10);
float IEY = random(50-10, 50+10);
float IEXspeed = 1.0, IEYspeed = 0.5;
int IEXflip = 1, IEYflip = 1;
float vari = 1;

float SafariX = random(150-25, 150+25);
float SafariY = random(200-25, 200+20);
float SafariXspeed = 2.0, SafariYspeed = 1.5;
int SafariXflip = 1, SafariYflip = 1;

void setup() {
  size(600, 450);
  chrome = loadImage("Chrome.png");
  firefox = loadImage("firefox.png");
  IE = loadImage("IE.png");
  Safari = loadImage("Safari.png");
  desktop = loadImage("desktop.jpg");
}

void draw() {
  time = millis()/1000;
  vari = vari+1;
  image(desktop, 0, 0);
   if(time>0){
      if(time<45){
        chromeX = chromeX + (chromeXspeed * chromeXflip);
        chromeY = chromeY + (chromeYspeed * chromeYflip);
      }
   }
         
        if(chromeX >width-50 || chromeX < 0){
          chromeXflip *= -1;
        }
        if(chromeY >height-50 || chromeY <0){
          chromeYflip *= -1;
        }
         
        chrome.resize(80, 80);
        image(chrome, chromeX, chromeY);
    
    if(time>0){
      if(time<45){
        firefoxX = firefoxX + (firefoxXspeed * firefoxXflip);
        firefoxY = firefoxY + (firefoxYspeed * firefoxYflip);
      }
   }
         
        if(firefoxX >width-50 || firefoxX < 0){
          firefoxXflip *= -1;
        }
        if(firefoxY >height-50 || firefoxY <0){
          firefoxYflip *= -1;
        }
  firefox.resize(80, 80);
  image(firefox, firefoxX, firefoxY);
  
  if(time>0){
      if(time<10){
        IEX = IEX + (IEXspeed * IEXflip);
        IEY = IEY + (IEYspeed * IEYflip);
      }
   }
         
        if(IEX >width-50 || IEX < 0){
          IEXflip *= -1;
        }
        if(IEY >height-50 || IEY <0){
          IEYflip *= -1;
        }
  IE.resize(80, 80);
  image(IE, IEX, IEY);
   if (vari >= 350) {
    IE.filter(GRAY);
  }
  
   if(time>0){
      if(time<45){
        SafariX = SafariX + (SafariXspeed * SafariXflip);
        SafariY = SafariY + (SafariYspeed * SafariYflip);
      }
   }
         
        if(SafariX >width-50 || SafariX < 0){
          SafariXflip *= -1;
        }
        if(SafariY >height-50 || SafariY <0){
          SafariYflip *= -1;
        }
  Safari.resize(80, 80);
  image(Safari, SafariX, SafariY);
}


