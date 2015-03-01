
JSONObject json;
JSONArray list;
String query = "";
String url = "";
String setup = "";
String apiKey = "";

int[] years;
int[] wordcounts;
String[] article_titles;

// read/write to file
Table table;

// Smoke particle
ParticleSystem[] ps;

void setup() {
  size(1200, 800);

  apiKey = "74548056debe1698254a3a07babc9f84:3:60371965";
  url = "http://api.nytimes.com/svc/search/v2/articlesearch.json?q=";
  query = "marijuana";
  setup = "&fl=keywords%2Cheadline";

  //background(0);

  table = new Table();
  table.addColumn("year");
  table.addColumn("count");
  table.addColumn("article");

  /** Get data from NYT API and write to wordcount.csv file
   for (int i=1926; i<2014; i++) {
   try {
   json = loadJSONObject(url+query+"&api-key="+apiKey+setup+"&begin_date="+i+"0101&"+"end_date="+i+"1231");
   
   TableRow newRow = table.addRow();
   newRow.setInt("year", i);
   newRow.setInt("count", json.getJSONObject("response").getJSONObject("meta").getInt("hits"));
   
   String article_title = "";
   if (json.getJSONObject("response").getJSONObject("meta").getInt("hits") > 0) {
   article_title = json.getJSONObject("response").getJSONArray("docs").getJSONObject(0).getJSONObject("headline").getString("main");
   }
   
   newRow.setString("article", article_title);      
   delay(100);
   }
   catch (Exception e) {
   println("error with year: "+i + " error: "+e);
   }    
   }
   
   saveTable(table, "wordcount.csv");  
   */

  // read from wordcount.csv file  
  table = loadTable("wordcount.csv", "header");

  // initialize variables
  int table_size = table.getRowCount();
  years = new int[table_size];
  wordcounts = new int[table_size];
  article_titles = new String[table_size];

  int i = 0;
  for (TableRow row : table.rows ()) {
    years[i] = row.getInt("year");
    wordcounts[i] = row.getInt("count");
    article_titles[i] = row.getString("article");        
    i++;
  }  

  //Load smoke Image
  PImage img = loadImage("texture.png");
  img.resize(50, 50);
  //initiate particle system array
  ps = new ParticleSystem[table_size];
  //set position of particles
  for (int j=0; j<years.length; j++) {
    ps[j] = new ParticleSystem(0, new PVector(50+1100*j/years.length, 750), img);
  }
}

void draw() {
  background(0);

  // Calculate a "wind" force based on mouse horizontal position
  //float dx = map(mouseX, 0, width, -0.2, 0.2);  

  for (int i=0; i < years.length; i++) {
    //resize the count to fit screen
    PVector wind = new PVector(0, -0.001*((wordcounts[i])));
    //Draw particle for each year. Use log to add density.
    for (int j=0; j<2+log (wordcounts[i]); j++) {
      ps[i].applyForce(wind);
      ps[i].run();
      ps[i].addParticle();
    }
  }

  //Disply years.
  //for (int j=0; j<years.length; j++) {
    //ps[j] = new ParticleSystem(0, new PVector(50+1100*j/years.length, 750), img);
    fill(255);
    textSize(12);
    textAlign(CENTER);
    text("1926", 50, 780);
    text("1947", 325, 780);
    text("1969", 600, 780);
    text("1991", 875, 780);
    text("2013", 1150, 780);
  //}


  // Draw an arrow representing the wind force
  //drawVector(wind, new PVector(width/2, 50, 0), 500);

  // //Year 1926 to 2013. Draw ellipse on bottom. 
  // for (int i = 5; i < years.length; i++) {
  //   noStroke();
  //   fill(255);
  //   ellipse(i*13, 750, 10, 10);
  // }
}

// A simple Particle class, renders the particle as an image

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  PImage img;

  Particle(PVector l,PImage img_) {
    acc = new PVector(0,0);
    float vx = randomGaussian()*0.3;
    float vy = randomGaussian()*0.3 - 1.0;
    vel = new PVector(vx,vy);
    loc = l.get();
    lifespan = 100.0;
    img = img_;
  }

  void run() {
    update();
    render();
  }
  
  // Method to apply a force vector to the Particle object
  // Note we are ignoring "mass" here
  void applyForce(PVector f) {
    acc.add(f);
  }  

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    lifespan -= 2.5;
    acc.mult(0); // clear Acceleration
  }

  // Method to display
  void render() {
    imageMode(CENTER);
    tint(255,lifespan);
    image(img,loc.x,loc.y);
    // Drawing a circle instead
    // fill(255,lifespan);
    // noStroke();
    // ellipse(loc.x,loc.y,img.width,img.height);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed
  PImage img;
  
  ParticleSystem(int num, PVector v, PImage img_) {
    particles = new ArrayList<Particle>();              // Initialize the arraylist
    origin = v.get();                                   // Store the origin point
    img = img_;
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin, img));         // Add "num" amount of particles to the arraylist
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  // Method to add a force vector to all particles currently in the system
  void applyForce(PVector dir) {
    // Enhanced loop!!!
    for (Particle p: particles) {
      p.applyForce(dir);
    }
  
  }  

  void addParticle() {
    particles.add(new Particle(origin,img));
  }

}


