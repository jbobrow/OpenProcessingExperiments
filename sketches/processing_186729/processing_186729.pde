
PImage cabina;
PImage gat;
PImage galactica;
PImage basecylon;

boolean pota = false; //DETERMINA INICI------------------------------------------------

String s = "Miauu!";
//PFont font;
int stars = 59;
float [] starx = new float [stars];
float [] stary = new float [stars];
float [] starsz = new float [stars];
float [] starvel = new float [stars];

float posx = -50;
float posy = -700;
float vel = 1;

void setup() {
  size(800, 600);
  cabina = loadImage("viperCabina.png");
  gat = loadImage("kitty.png");
  galactica = loadImage("BGS.png");
  basecylon= loadImage ("wwewewe.png");
  //font = loadFont("DietAngst-30.vlw");

  for (int i =0; i<stars; i++) {
    starx[i] = int(random(width));
    stary[i] = int(random(height-150));
    starsz[i] = int(random(2, 8)); 
    starvel[i] = int(7);
  }
}



///////////////////////////////////DRAW////////////////////////////
void draw() {
  println(second());

  /////////////fons///////////
  fill(0, 10, 50, 50);
  noStroke();
  rect(0, 0, width, height);

  /////////STARS////


  for (int i =0; i<second (); i++) {
    stroke(255);
    strokeWeight(starsz[i]);
    point(starx[i], stary[i]);

    if ((second()%59)==0) { //aixo hauria de fer que NOMES AL SEGON 59 ES MOGUESSIN
      starx[i]=starx[i]+starvel[i];
      stary[i]=stary[i]+starvel[i];
      
      starx[i]=starx[i]-starvel[i];
      stary[i]=stary[i]-starvel[i];
          
        starx[i] = int(random(width));
        stary[i] = int(random(height-150));
    }
  }

  ////////GALACTICA//////EMBOSCADA/////
  if (minute()==0) {
    if ((hour()==2) || (hour()==4) || (hour()==6) || (hour()==8) || (hour()==0)) {
      image(galactica, posx, posy);
      posx = posx+vel;
      posy = posy+vel;
    } else {
      image(basecylon, posx+500, 0);
      posx = posx+-vel;
    }
  }

  /////////////CABINA////
  cabina.resize(width, height/2);
  image (cabina, 0, height/2);

////////////////////GAT/////////////////////////
  if ((second()>=0) && (second()>=58)) {
    miau();
    pota = true;
  } else {
    pota = false;
  }    
    gat();
  }

void gat () {
  if (pota==true) {
    gat.resize(120,230);
     image (gat, 450, 425);
  } else {
    gat.resize(120,230);
    image (gat, 450, 395);
  }
}

void miau (){
  //textFont(font);
  textSize(32);
  fill(random(175,255));
  text(s, 200,400);
}
