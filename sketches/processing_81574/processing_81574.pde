
int SA = 900; float ASA = 90;

String[] page = loadStrings("http://www.j2ski.com//snow_forecast/Scotland/");
String[] info = new String[40];

String pageString;

PImage logo;
PFont font;

float[][] snow = new float[SA][3];
float windSpeed = random(2);
float newWindSpeed = 0;

String state = "RANGES";
String range = "";

int which = 0;

void setup() {
  logo = loadImage("logo.png");
  font = loadFont("Calibri-48.vlw");
  size(320,480);
  for( int i = 0 ; i < SA ; i++ ) {
    snow[i][0] = int(random(width));
    snow[i][1] = int(random(height));
    snow[i][2] = random(3)+1;
  }
  noStroke();

  for (int i=192;i<198;i++) {
    pageString += page[i].replace("\"","");
  }
  
  page = split(pageString,">");
  
  int j = 0;
  
  for (int i=0;i<page.length;i++)
    if(page[i].length() > 1)
      if(page[i].charAt(0) != '<' || page[i].charAt(1) == 's') {
        info[j] = page[i].replace("</td","").replace("<tr","").replace("</a","").replace("</b","").replace("<span class=","");
        print(info[j]+"\n");
        j++;
      }

}

void snow() {
  if (frameCount%100 == 0)
    newWindSpeed = random(1.5)-.5;
  if (windSpeed < newWindSpeed)
    windSpeed += .005;
  else
    windSpeed -= .005;
  for( int i = 0 ; i < ASA/100*SA ; i++ ) {
    snow[i][1]++;
    snow[i][0] += snow[i][2]*windSpeed;
    snow[i][1] %= height;
    snow[i][0] %= width;
    if (snow[i][0] < 0) snow[i][0] += width;
    if( snow[i][2] < 3 ) ellipse(snow[i][0],snow[i][1],snow[i][2],snow[i][2]);
  }
  image(logo, 0, -10, width, 164);
  for( int i = 0 ; i < ASA/100*SA ; i++ )
    if( snow[i][2] >= 3 ) ellipse(snow[i][0],snow[i][1],snow[i][2],snow[i][2]);
}

void draw() {

  background(72,213,253);
  fill(255);
  noStroke();

  snow();

  textFont(font, 32);
  textAlign(CENTER);
  
  if( state == "RANGES" ) {

    ASA = 100;
    fill(255,50);
    if( mouseY < 390 ) {
      if( mouseY > 350 ) {
        rect(0,350,width,40);
        if( mousePressed ) {
          state = "DETAILS";
          which = 4;
        }
      } else if( mouseY > 300 ) {
        rect(0,300,width,40);
        if( mousePressed ) {
          state = "DETAILS";
          which = 3;
        }
      } else if( mouseY > 250 ) {
        rect(0,250,width,40);
        if( mousePressed ) {
          state = "DETAILS";
          which = 2;
        }
      } else if( mouseY > 200 ) {
        rect(0,200,width,40);
        if( mousePressed ) {
          state = "DETAILS";
          which = 1;
        }
      } else if( mouseY > 150 ) {
        rect(0,150,width,40);
        if( mousePressed ) {
          state = "DETAILS";
          which = 0;
        }
      }
    } else if( mouseY > 440 ) {
      rect(0,440,width,40);
      if( mousePressed ) {
        state = "ABOUT";
      }
    }
    
    fill(255);
    text(info[4], 160, 180);
    text(info[1*7+4],160,230);
    text(info[2*7+4],160,280);
    text(info[3*7+4],160,330);
    text(info[4*7+4],160,380);
    text("About",160,470);

  } else if( state == "DETAILS" ) {

    ASA = min( ( Float.parseFloat(info[which*7+1]) / 30 ) * 100 , 100 );
    text("Back",160,430);
    textAlign(LEFT);
    fill(255);
    textSize(20);
    text(info[which*7+4],20,180);
    text("Status: "+info[which*7+3],20,230);
    text("Next Date of snow: "+info[which*7+7],20,280);
    text("Current Snow Height: "+info[which*7+1]+"cm",20,330);
    text("Forecast (48 hrs): "+info[which*7+6], 20, 380);
    fill(255,50);
    textSize(48);

    if( mouseY > 400 && mouseY < 440 ) {
      rect(0,400,width,40);
      if( mousePressed )
        state = "RANGES";
    }

  } else if( state == "ABOUT" ) {

    text("This app will tell you", 160, 180);
    text("details about the state", 160, 230);
    text("of Scotland's", 160, 280);
    text("mountain ranges.", 160, 330);
    text("Back",160,430);
    fill(255,50);

    if( mouseY > 400 && mouseY < 440 ) {
      rect(0,400,width,40);
      if( mousePressed )
        state = "RANGES";
    }

  }
}

