
var x, y, A, B, a, A1, a1, B1;
var r1, r2, rg, R2;
var R;
var img, img2, img3, img4, back;

function setup() {
    x = displayWidth; //adjustable
    y = displayHeight; //adjustable
    rg = 9; //radius given by table, which is the radius of planet compared to the earths radius
    noStroke();
  background(0);
  frameRate( 15 );
  createCanvas(x,y); //size of window
  back = loadImage("stars.jpg");
    img = loadImage("earth.png");
  img2 = loadImage("exo1.png");
  img3 = loadImage("exo2.png");
  img4 = loadImage("exo3.png");
}

function draw() {
    
    r1 = 5; //radius of earth on screen //fixed
    //R = 3959 * m ; // getting the radius of the exo out of ratio
  R2 = rg * 3959;
  r2 = (5 * R2)/3959;
  r1 = r1 * 7;
  r2 = r2 * 7;
    if (rg > 10) { ///when exoplanets radius is larger than earth
      
    background(0);
    imageMode(CENTER);
    image(back, x/2, y/2, x, y);
    A = x/4;
      B = y/2;
      a = 3*x/4;
    A1 = A + 5*sin(2+ frameCount / 4 );
    a1 = a + ((10/rg)+3)*sin( frameCount / 4 ); // im doing 10/m to offset the oscillation with inverse proportionality to the radius, so that bigger objects oscillate less and dont cover the earth
    //adding + 4 to the amplitude so that it has a minmum of 4 even when they are really big
    //B1 = B + 10*sin( frameCount / 4 );
      //ellipse(A1, B, r1, r1);
    imageMode(CENTER);
    image(img, A1, B, r1, r1); //earth
    imageMode(CENTER);
      image(img2, a1, B, r2, r2); //exo red giant
      //ellipse(a1, B, r2, r2);
      textSize(30);
    stroke(0);
      fill(21, 116, 150);
      text("EARTH", A-47, y/15);
      fill(21, 116, 150);
      text("EXOPLANET", a-80, y/15);
    } else if (rg <= 1) { //when exoplanets radius is smaller than earth
      background(0);  
    imageMode(CENTER);
    image(back, x/2, y/2, x, y);
    A = x/4;
      B = y/2;
      a = 3*x/4;
    A1 = A + 5*sin(2+ frameCount / 4 );
    a1 = a + (4)*sin( frameCount / 4 );
    //B1 = B + 10*sin( frameCount / 4 );
    imageMode(CENTER);
    image(img, A1, B, r1*10, r1*10);
    imageMode(CENTER);
      image(img3, a1, B, r2*10, r2*10);
      //ellipse(a1, B, r2*10, r2*10);
      textSize(30);
    stroke(0);
      fill(21, 116, 150);
      text("EARTH", A-47, y/15);
      fill(21, 116, 150);
      text("EXOPLANET", a-80, y/15);
    } else {
      background(0);
    imageMode(CENTER);
    image(back, x/2, y/2, x, y);
    A = x/4;
      B = y/2 ;
      a = 3*x/4;
    A1 = A + 5*sin(2+ frameCount / 4 );
    a1 = a + ((10/rg)+3)*sin( frameCount / 4 );
    //B1 = B + 10*sin( frameCount / 4 );
    imageMode(CENTER);
    image(img, A1, B, r1, r1); // earth
    imageMode(CENTER);
    image(img4, a1, B, r2, r2); //exo
      //ellipse(a1, B, r2, r2);
      textSize(30);
    stroke(0);
      fill(21, 116, 150);
      text("EARTH", A-47, y/15);
      fill(21, 116, 150);
      text("EXOPLANET", a-80, y/15);
    }
}



