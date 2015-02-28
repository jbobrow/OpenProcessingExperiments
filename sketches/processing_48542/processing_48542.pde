
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  //fade out funtion; the larger the number, the longer////////////////////
  float life = 3550;
  float topspeed;
  int size;
  float multiplier;
  color col;
  String msg;

  Mover(color tcol, int xsp, float xmu) {
    size = int(random(4, 1));
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(width), random(height));
    topspeed = xsp;
    multiplier = xmu;
//    msg = getMsg();
    int x = int(random(0, 255));

    float c = random(0, 80);
    float m = random(0, 55);
    float y = random(0, 0);
    float k = random(0, 30);
    //col = convert(c, m, y, k);
    col = tcol;
  }

  //fade out funtion////////////////////
  boolean finished() {
    // Balls fade out
    life-=10;
    if (life < 0) {
      return true;
    } 
    else {
      return false;
    }
  }

  void fadeOut() {
    // Balls fade out
    life--;
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
    fill(col, life/10.0);
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


//  String getMsg()
//  {
//    try {
//      q = new Query(terms[index]);
//      q.setRpp(1);

//      QueryResult result = twitter.search(q);
      //Cast the list of tweets into an ArrayList
//      ArrayList tweets = (ArrayList) result.getTweets();

      //and instead of a for loop, just get(0);
      //Pull out this particular Tweet object. 
//      Tweet t = (Tweet) tweets.get(0);
//      return t.getText();

      //println(usr+ ":  " + msg + "   ("+d+")");
//    }
//    catch(TwitterException te) {
      //println(te);
//      return te.toString();
//    }
//  }
}


