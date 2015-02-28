
ArrayList<String> words = new ArrayList();
PShape a;
Mover[] movers = new Mover[190];
Mover[] movers2 = new Mover[25];
Mover[] movers3 = new Mover[7];

//VOID SETUP//////////////////// 
void setup() {
  size(800, 800);
  smooth();
  background(0);
  
    //twitter stuff
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("PLmGEQtruhjtEDryFyx0rA");
  cb.setOAuthConsumerSecret("yN5ubhMXKkJjRF151m2M2awWQXmkaQzMgOkksyLtI");
  cb.setOAuthAccessToken("317405665-ojRo56DtA5KFvfujk39EM60g9Tk75DrE0f4VvO2N");
  cb.setOAuthAccessTokenSecret("oo2LazqjdMzYtiFUTlQWA3vzmifTOxUA3C8xzB11E");
 
  Twitter twitter = new TwitterFactory(cb.build()).getInstance();
  Query query = new Query("science");
  query.setRpp(100);
  
  
  
  a = loadShape("mos.svg");
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(4, .07);
  }
  for (int i = 0; i < movers2.length; i++) {
    movers2[i] = new Mover(4, .13);
  }
  for (int i = 0; i < movers3.length; i++) {
    movers3[i] = new Mover(4, .2);
  }
}

//VOID DRAW////////////////////
void draw() {
  noStroke();
  fill(255);
  rect(0, 0, width, height);


  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
  for (int i = 0; i < movers2.length; i++) {
    movers2[i].update();
    movers2[i].checkEdges();
    movers2[i].display();
  }
  for (int i = 0; i < movers3.length; i++) {
    movers3[i].update();
    movers3[i].checkEdges();
    movers3[i].display();
  }
  shape (a, -200, -200, 1200, 1200);
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  int size;
  float multiplier;
  color col;

  Mover(int xsp, float xmu) {
    size = int(random(4, 9.5));
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(width), random(height));
    topspeed = xsp;
    multiplier = xmu;
    int x = int(random(0, 255));

    float c = random(0, 100);
    float m = random(0, 100);
    float y = random(0, 0);
    float k = random(0, 0);
    col = convert(c, m, y, k);
  }

  //VOID UPDATE////////////////////
  void update() {


    PVector mouse = new PVector(width/2, height/2);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(multiplier);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  //COLOR//9*I;//////////////////
  color convert(float c, float m, float y, float k) {
    c = c / 100;
    m = m / 100;
    y = y / 100;
    k = k / 100;

    c = ( c * ( 1 - k ) + k );
    m = ( m * ( 1 - k ) + k );
    y = ( y * ( 1 - k ) + k );

    float r = ( 1 - c ) * 255;
    float g = ( 1 - m ) * 255;
    float b = ( 1 - y ) * 255;

    return color(r, g, b);
  }

  //VOID DISPLAY////////////////////
  void display() {
    noStroke();
    fill(col);
    ellipse(location.x, location.y, size, size);
  }
  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    }
    else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }
    else if (location.y < 0) {
      location.y = height;
    }
  }
}


