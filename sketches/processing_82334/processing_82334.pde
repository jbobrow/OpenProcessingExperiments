
int num_game = 5;
Game[] game;
ArrayList keywords = new ArrayList();
KeywordLegend keywordLegend = new KeywordLegend();
Timeline tl;
PFont font;
Axis axis = new Axis();
float m_x = 10;
float m_y = 100;
float m_width = 1180;
float m_height = 740-80;
int showTweet = -1;
Introduction introduction;
boolean dragging = false;
boolean underIntroduction = true;
int focus=-1;
int keywordConnection = -1;
PImage bg;

void setup() {
  size(1200, 800, P2D);
  frameRate(30);
  bg = loadImage("bg.png");
  introduction = new Introduction();
  introduction.draw();
  //smooth();
  game = new Game[num_game];  
  initialize_games();
  initialize_keyword();
  font = loadFont("CenturyGothic-48.vlw");


  tl = new Timeline();
  keywordLegend.dis_keywords = "Feelings";
  tl.draw();
}

void draw() {
  if (underIntroduction) {
    introduction.draw();
  }
  else {
    noStroke();
    background(255);


    fill(255);
    noStroke();
    //stroke(0,125);
    //strokeWeight(4);
    rect(m_x, m_y, m_width, m_height);

    axis.draw(tl.now);
    collision(tl.now, axis);

    fill(#000080, 180);// outer frame color
    noStroke();
    //    rect(m_x-5, m_y-5, m_width+10, 5);
    //    rect(m_x-5, m_y-5, 5, m_height+10);
    //    rect(m_x+m_width, m_y, 5, m_height+10);
    rect(m_x, m_y+m_height, m_width+10, 3 );

    fill(250);
    noStroke();
    rect(0, 0, width, 5);
    rect(0, m_y+m_height+5, width, height);
    rect(0, 0, 5, height);
    rect(m_x+m_width+5, 0, width, height);


    tl.draw();

    fill(10);
    textFont(font, 14);
    textAlign(RIGHT);

    keywordLegend.display();
  }
  //   image(bg,width-300,25);
  image(bg, 150,25);
}

void mousePressed() {
  if (mouseX>m_x && mouseY>m_y &&mouseX<m_x+m_width &&mouseY<m_y+m_height) {
    int focus_old = focus;
    int keywordConnection_old = keywordConnection;
    focus=-1;
    keywordConnection = -1;
    for (int i=0; i<num_game; i++) {
      if (game[i].click()) {
        focus = i;
        keywordConnection = keywordConnection_old;
      }
    }
    for (int i=0; i<keywords.size(); i++) {
      Keyword kw = (Keyword)keywords.get(i);
      if (kw.click()) {
        keywordConnection = i;
        focus = focus_old;
      }
    }
  }
  introduction.forward();
  keywordLegend.click();
  tl.mousePress();
}

void mouseDragged() {
  if (keywordConnection>=0) {
    showTweet  = keywordConnection;
    dragging = true;
    Keyword kw = (Keyword)keywords.get(keywordConnection);
    kw.x = mouseX; 
    kw.y = mouseY;
    //kw.m = 1e9;
  }
}

void mouseReleased() {
  showTweet = -1;
  dragging = false;
}

class Axis {
  float x_lb = 1000;
  float x_ub = 0;
  float y_lb = 1000;
  float y_ub = 0;
  float x_lb_g = 1000;
  float x_ub_g = 0;
  float y_lb_g = 1000;
  float y_ub_g = 0;
  Date since;

  Axis() {
    SimpleDateFormat df = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
    try {
      since = df.parse("Tue, 12 Nov 2012 19:00:00 -0500");
    }
    catch(Exception e) {
      println(e);
    }
  }

  void set_x(float x) {

    if (x<x_lb_g) x_lb_g = x;
    if (x>x_ub_g) x_ub_g = x;
    
  }

  void set_y(float y) {

    if (y<y_lb_g) y_lb_g = y;
    if (y>y_ub_g) y_ub_g = y;
    
  }

  void draw(Date now) {
    float duration = (now.getTime() - since.getTime())/(1000.0);
    since = (Date)now.clone();
    for (int i=0;i<duration; i++) {
      //x_lb+=0.000003;
      //x_ub-=0.0000003;
      //y_ub+=0.00000000003;
      //y_lb-=0.00000000003;
    }
    if(focus>=0){
      x_ub = game[focus].mention*1.5;
      x_lb = game[focus].mention*0.5;
      y_ub = game[focus].nowRank*1.5;
      y_lb = game[focus].nowRank*0.5;
    }else{
      x_ub = x_ub_g;
      x_lb = x_lb_g;
      y_ub = y_ub_g;
      y_lb = y_lb_g;
    }
    if (x_lb==x_ub) x_lb-=0.01;
    if (y_lb==y_ub) y_lb-=0.01;
    //draw_y_axis();
    //draw_x_axis();
  }

  void draw_x_axis() {
    int step_size = 0;
    //    fill(125, 255);
    fill(0);
    textSize(10);
    textAlign(LEFT, TOP);
    //text(x_lb, 0, height/2+6);
    text("Tweets-Per-Minute mentioned the Game ", m_x+5, (m_y+m_height)/2-16);
    text("Low frequency", m_x+5, (m_y+m_height)/2+16);
    textAlign(RIGHT, TOP);
    //text(x_ub, width-5, height/2+6);
    text("High frequency", m_x+m_width-5, (m_y+m_height)/2+16);
    stroke(125, 255);
    strokeWeight(1);
    textAlign(CENTER, TOP);
    line(m_x, (m_y+m_height)/2, m_x+m_width, (m_y+m_height)/2);
    if (x_ub-x_lb<40) {
      step_size = -1;
    }
    if (x_ub-x_lb<4) {
      step_size = -2;
    }
    if (x_ub - x_lb<0.4) {
      step_size = -3;
    }
    for (float i=x_lb; i<x_ub; i+=pow(10, step_size-1)) {
      //println(((int)(i*10))%10);
      float h = (m_width-2*30)*((i-x_lb)/(x_ub-x_lb))+30+m_x;
      boolean small_bar = true;
      boolean big_bar = true;
      for(int j=step_size-1; j<=step_size; j++){
        if(((int)(i/pow(10, j)))%10!=0){
          big_bar = false;
          if(j==step_size) continue;
          small_bar = false;
        }
      }
      if(big_bar){
        line(h, (m_y+m_height)/2, h, (m_y+m_height)/2+4 );
        text(String.format("%2.2f", i), h, (m_y+m_height)/2+6);
      }else if(small_bar){
        line(h, (m_y+m_height)/2, h, (m_y+m_height)/2+2 );
      }
    }
  }

  void draw_y_axis() {
    int step_size=1;
    //    fill(125, 255);
    fill(10);
    noStroke();
    textSize(10);
    textAlign(LEFT, BOTTOM);
    text("Relatively Low-Rank Game", (m_x+m_width)/2-70, m_height-5);
    //    text(String.format("%2.0f%%", y_lb*100), width/2-36, height-5);
    textAlign(LEFT, TOP);
    text("Relatively High-Rank Game", (m_x+m_width)/2-75, m_y+5);
    //    text(String.format("%2.0f%%", y_ub*100), width/2-36, 20);
    stroke(125, 255);
    strokeWeight(1);
    textAlign(LEFT, CENTER);
    line((m_x+m_width)/2, m_y, (m_x+m_width)/2, m_y+m_height);
    
    if (y_ub - y_lb<300) {
      step_size = 0;
    }
    if (y_ub - y_lb<30) {
      step_size = -1;
    }
    if (y_ub - y_lb<3) {
      step_size = -2;
    }
    for (float i=y_lb; i<y_ub; i+=pow(10, step_size-1)) {
      //println(((int)(i*10))%10);
      float h = (i-y_lb)/(y_ub-y_lb)*(m_height-2*30)+30+m_y;
      boolean small_bar = true;
      boolean big_bar = true;
      for(int j=step_size-1; j<=step_size; j++){
        if(((int)(i/pow(10, j)))%10!=0){
          big_bar = false;
          if(j==step_size) continue;
          small_bar = false;
        }
      }
      if(big_bar){
        line((m_x+m_width)/2, h, (m_x+m_width)/2+4, h );
        text(String.format("%2."+String.valueOf(-step_size)+"f", i), (m_x+m_width)/2+8, h);
      }else if(small_bar){
        line((m_x+m_width)/2, h, (m_x+m_width)/2+4, h );
      }
    }
  }
}

class Ball {
  float x, y, r, vx, vy, m, speed, angle;

  Ball() {
  }

  void toBall(float x, float y, float r, float vx, float vy, float m) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.vx = vx;
    this.vy = vy;
    this.m = m;
  }
  
  boolean mouseOver(){
    float dist = sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));
    if(dist<r){
      return true;
    }
    return false;
  }
  boolean click(){
    float dist = sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));
    if(dist<r){
      return true;
    }
    return false;
  }
}

class Button{
  float x, y, r;
  PImage icon;
  
  Button(float x, float y, float r,  PImage icon){
    this.x = x;
    this.y = y;
    this.r = r;
    this.icon = icon;
  }
  
  void draw(){
    stroke(0);
    strokeWeight(3);
    ellipseMode(CENTER);
    noFill();
    //ellipse(x,y,2*r,2*r);
    float s = 1;
    tint(#4169E1);
    image(icon, x-s*r, y-s*r, 2*(s*r), 2*(s*r));
  }
  
  boolean pressed(){
    if(sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y))<r){
      return true;
    }
    return false;
  }
  
}
void collision(Date now, Axis axis) {
  
  for (int i=0;i<keywords.size();i++) {
    Keyword keyword = (Keyword) keywords.get(i);
    keyword.move(game, now);
    if(focus<0){
      keyword.boundaryCollision();
    }
    
  }
  
  for (int i=0; i<num_game; i++) {
    game[i].update(axis, now);
    game[i].drawYellowRing();
  }
  
  for (int i=0;i<keywords.size();i++) {
    Keyword keyword = (Keyword) keywords.get(i);    
    keyword.draw();
  }
  
  for (int i=0; i<num_game; i++) {
    game[i].update(axis, now);
    game[i].draw();
  }

  for (int i=0; i<keywords.size(); i++) {
    for (int j=i+1; j<keywords.size(); j++) {
      Keyword keyword = (Keyword) keywords.get(i);
      Keyword keyword2 = (Keyword) keywords.get(j);
      checkObjectCollision(keyword, keyword2);
    }
    for (int j=0; j<num_game; j++) {
      Keyword keyword = (Keyword) keywords.get(i);
      checkObjectCollision(keyword, game[j]);
    }
  }

  for (int i=keywords.size()-1; i>=0; i--) {
    for (int j=keywords.size()-1; j>i; j--) {
      Keyword keyword = (Keyword) keywords.get(i);
      Keyword keyword2 = (Keyword) keywords.get(j);
      checkObjectCollision(keyword, keyword2);
    }
    for (int j=0; j<num_game; j++) {
      Keyword keyword = (Keyword) keywords.get(i);
      checkObjectCollision(keyword, game[j]);
    }
  }
}


void checkObjectCollision(Ball b1, Ball b0) {

  // get distances between the balls components
  PVector bVect = new PVector();
  bVect.x = b1.x - b0.x;
  bVect.y = b1.y - b0.y;

  // calculate magnitude of the vector separating the balls
  float bVectMag = sqrt(bVect.x * bVect.x + bVect.y * bVect.y);
  if (bVectMag < b0.r + b1.r) {
    // get angle of bVect
    float theta  = atan2(bVect.y, bVect.x);
    // precalculate trig values
    float sine = sin(theta);
    float cosine = cos(theta);

    /* bTemp will hold rotated ball positions. You 
     just need to worry about bTemp[1] position*/
    Ball[] bTemp = {  
      new Ball(), new Ball()
      };

      /* b1's position is relative to b0's
       so you can use the vector between them (bVect) as the 
       reference point in the rotation expressions.
       bTemp[0].x and bTemp[0].y will initialize
       automatically to 0.0, which is what you want
       since b1 will rotate around b0 */
      bTemp[1].x  = cosine * bVect.x + sine * bVect.y;
    bTemp[1].y  = cosine * bVect.y - sine * bVect.x;

    // rotate Temporary velocities
    PVector[] vTemp = { 
      new PVector(), new PVector()
      };
      vTemp[0].x  = cosine * b0.vx + sine * b0.vy;
    vTemp[0].y  = cosine * b0.vy - sine * b0.vx;
    vTemp[1].x  = cosine * b1.vx + sine * b1.vy;
    vTemp[1].y  = cosine * b1.vy - sine * b1.vx;

    /* Now that velocities are rotated, you can use 1D
     conservation of momentum equations to calculate 
     the final velocity along the x-axis. */
    PVector[] vFinal = {  
      new PVector(), new PVector()
      };
      // final rotated velocity for b0
      vFinal[0].x = ((b0.m - b1.m) * vTemp[0].x + 2 * b1.m * 
        vTemp[1].x) / (b0.m + b1.m);
    vFinal[0].y = vTemp[0].y;
    // final rotated velocity for b0
    vFinal[1].x = ((b1.m - b0.m) * vTemp[1].x + 2 * b0.m * 
      vTemp[0].x) / (b0.m + b1.m);
    vFinal[1].y = vTemp[1].y;

    // hack to avoid clumping
    bTemp[0].x += vFinal[0].x;
    bTemp[1].x += vFinal[1].x;

    /* Rotate ball positions and velocities back
     Reverse signs in trig expressions to rotate 
     in the opposite direction */
    // rotate balls
    Ball[] bFinal = { 
      new Ball(), new Ball()
      };
      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
    bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
    bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
    bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

    // update balls to screen position
    b1.x = b0.x + bFinal[1].x;
    b1.y = b0.y + bFinal[1].y;
    b0.x = b0.x + bFinal[0].x;
    b0.y = b0.y + bFinal[0].y;

    while (true) {
      PVector bv = new PVector();
      bv.x = b1.x - b0.x;
      bv.y = b1.y - b0.y;
      float bvMag = sqrt(bv.x * bv.x + bv.y * bv.y);
      //println(bvMag);
      if (bvMag < b0.r + b1.r) {
        b1.x = b1.x + bVect.x*(1/b1.m)/100;
        b1.y = b1.y + bVect.y*(1/b1.m)/100;
        b0.x = b0.x - bVect.x*(1/b0.m)/100;
        b0.y = b0.y - bVect.y*(1/b0.m)/100;
      }
      else {
        break;
      }
    }

    // update velocities
    b0.vx = cosine * vFinal[0].x - sine * vFinal[0].y;
    b0.vy = cosine * vFinal[0].y + sine * vFinal[0].x;
    b1.vx = cosine * vFinal[1].x - sine * vFinal[1].y;
    b1.vy = cosine * vFinal[1].y + sine * vFinal[1].x;
  }
}

class Game extends Ball {
  String name; 
  String logo_name;
  PImage logo;
  ArrayList tweets;
  float mention = 1;
  float alpha = 0.001;//x_axis game_mention
  float alpha2 = 0.01;

  int game_mention;
  int keyword_count;//keep track of how many keywords insulted the game during a period
  int last_index = 0;
  ArrayList rank = new ArrayList();
  float nowRank = 1;
  Date since;


  Game(float x, float y, float r, float vx, float vy, String name, String logo_name, String rankFile) {
    super.toBall(x, y, r, vx, vy, 1e10);
    this.logo = loadImage(logo_name);
    this.name = name;
    //Load tweets
    tweets = new ArrayList();
    for (int i=13; i<=30; i++) {
      String[] s = null;
      s = loadStrings("tweets/"+name+" 2012-11-"+String.valueOf(i)+".csv");
      
      if (s==null) {
        continue;
      }
      //read in a invert order, because the tweets in each csv file are from the most recent to the oldest.
      for (int j=s.length-1; j>=0; j--) {
        String[] t = split(s[j], "\"");
        if (t.length == 5) {
          SimpleDateFormat df = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
          Date d;
          try {
            d = df.parse(t[1]);
          }
          catch(Exception e) { 
            continue;
          }
          
          tweets.add(new Tweet(d, t[3], name));
        }
      }
    }
    //initialize since
    SimpleDateFormat df = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
    try {
      since = df.parse("Tue, 12 Nov 2012 19:00:00 -0500");
    }
    catch(Exception e) {
      println(e);
    }
    //Load Rank info
    //"data/rank/"+
    String[] rankString = loadStrings("rank/"+rankFile);
    for (int i=0; i<rankString.length; i++) {
      String rs[] = rankString[i].split(",");
      if(rs.length<3){
        continue;
      }
      RankInfo ri = new RankInfo(rs[0], Integer.parseInt(rs[2]));
      //println(ri.time);
      rank.add(ri);
    }
  }

  int get_mention_time(Date until, Date since, Keyword k, int game_index) {
    keyword_count++;
    int i = k.last_index[game_index];
    int keyword_mention=0;
    float duration = (until.getTime() - since.getTime())/(1000.0*60);
    while (true) {
      if (i>=tweets.size()) {
        break;
      }
      Tweet t = (Tweet)tweets.get(i);
      if (t.created_at.after(until)) {
        k.last_index[game_index] = i;
        break;
      }
      else {
        if (t.text.contains(k.words)) {
          keyword_mention++;
          
          Keyword kw;
          if(showTweet<0){
            kw = null;
          }else{
            kw = (Keyword)keywords.get(showTweet);
          }
          if(kw!=k){
            k.tweet_text = t.original_text;
          }
        }
        i++;
        if (!t.scanned) {
          game_mention++;
          t.scanned = true;
          last_index=i;
        }
      }
    }
    return keyword_mention;
  }

  void update(Axis axis, Date now) {
    float duration = (now.getTime() - since.getTime())/(1000.0*60);
    //println(duration);
    since = (Date)now.clone();
    int i = last_index;

    //scan tweets for each game
    while (keywordLegend.dis_keywords.equals ("")) {//do not need, if some keywords is visible
      if (i>=tweets.size()) {
        break;
      }
      Tweet t = (Tweet)tweets.get(i);
      if (t.created_at.after(now)) {
        last_index = i;
        t.scanned = true;
        break;
      }
      else {
        game_mention++;
        i++;
      }
    }

    //find the most recent rank
    float recentRank=40;
    for (int j=0; j<rank.size(); j++) {
      RankInfo ri = (RankInfo)rank.get(j);
      if (now.after(ri.time)) {
        recentRank = ri.rank;
      }
    }

    if (duration>0) {
      for (int j=0; j<duration; j++) {
        mention = (1-alpha)*mention+alpha*game_mention/duration;
        nowRank = (1-alpha2)*nowRank+alpha2*recentRank;
      }
      game_mention=0;
      axis.set_x(mention);
      x=(m_width-2*r)*((mention-axis.x_lb)/(axis.x_ub-axis.x_lb))+r+m_x;
      axis.set_y(nowRank);
      y = (nowRank-axis.y_lb)/(axis.y_ub-axis.y_lb)*(m_height-2*r)+r+m_y;
      
    }
  }

  void draw() {
    
    //print(x); print(":"); println(y);
    tint(255,255);
    image(logo, x-r, y-r, r*2, r*2);
  }
  
  void drawYellowRing(){
     ellipseMode(CENTER);
    noStroke();
    //    fill(#FAFF00, 110);
    //    ellipse(x, y, 100, 100);   
    //    fill(#FAFF00, 80);
    //    ellipse(x, y, 150, 150);   
    fill(#FAFF7E, 70);
    ellipse(x, y, 200, 200);
    fill(#FAFF7E, 50);
    ellipse(x, y, 250, 250);
    fill(#FAFF7E, 30);
    ellipse(x, y, 300, 300);
    fill(#FAFF7E, 10);
    ellipse(x, y, 350, 350);
  }
  

}

class Introduction {
  ArrayList pics = new ArrayList();
  int showing = 0;


  Introduction() {
    //    pics.add( loadImage("data/intro/1.jpg") );
    //    pics.add( loadImage("data/intro/2.jpg") );
    //    pics.add( loadImage("data/intro/3.jpg") );
    //    pics.add( loadImage("data/intro/4.jpg") );
    //    pics.add( loadImage("data/intro/5.jpg") );
    //    pics.add( loadImage("data/intro/6.jpg") );
    //    pics.add( loadImage("data/intro/8.jpg") );
    //    pics.add( loadImage("data/intro/9.jpg") );
    pics.add( loadImage("intro0.jpg") );
    pics.add( loadImage("intro1.jpg") );
    pics.add( loadImage("intro2.jpg") );
  }

  void forward() {
    textSize(24);
    if (mouseX>1130-textWidth("Skip")/2 && mouseX<1130+textWidth("Skip")/2 && mouseY>730-(textAscent()+textDescent())/2 && mouseY<730+(textAscent()+textDescent())/2  ) {
      tl.running = true;
      underIntroduction = false;
      tl.last_time = millis();
    }
    if (mouseX>width/2) {
      showing++;
      if (showing >= pics.size()) {
        tl.running = true;
        underIntroduction = false;
        tl.last_time = millis();
      }
    }
    else {
      showing--;
      if (showing <0) {
        showing = 0;
      }
    }
  }

  void draw() {
    tint(255);
    if (showing<pics.size()) {
      PImage p = (PImage)pics.get(showing);
      image(p, 0, 0, width, height);
      textSize(20);
      textAlign(CENTER, CENTER);
//      rectMode(CENTER);
      fill(0, 20);
      rect(1100, 715, 55, 35);
      fill(0);
      text("Skip", 1130, 730);
    }
  }
}

class Keyword extends Ball {
  char insensibility;
  String type;

  PVector f;
  PVector a;
  float[] gravity = new float[num_game];
  float friction = 1.5; 
  String words;
  //last index 
  int[] last_index = new int[num_game];
  float alpha = 0.01;
  Date since = new Date(0);
  String tweet_text =  "";


  Keyword(String words, char insensibility, String type) {
    this.words = words.toLowerCase();
    this.insensibility = insensibility;
    this.type = type;
    SimpleDateFormat df = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
    try {
      since = df.parse("Tue, 12 Nov 2012 19:00:00 -0500");
    }
    catch(Exception e) {
      println(e);
    }
  }

  void Keyword2Ball(float x, float y, float r, float vx, float vy, float m) {
    super.toBall(x, y, r, vx, vy, m);
    this.f = new PVector();
    this.a = new PVector();
    for (int i=0; i<num_game; i++) {
      gravity[i] = 0;
    }
  }

  void move(Game[] game, Date now) {

    update(game, now, since);
    since = (Date)now.clone();
    f.x = 0; 
    f.y = 0;
    int gravity_index = 0;
    float gravity_temp = 0;
    for (int i=0;i<num_game;i++) {
      if (game[i].mention>0) {
        if ((gravity[i]/game[i].mention)>gravity_temp) {
          gravity_temp = gravity[i]/game[i].mention;
          gravity_index = i;
        }
      }

      if (Double.isNaN(f.x)) println("gra");
    }
    PVector vector = new PVector();
    vector.x = game[gravity_index].x - this.x;
    vector.y = game[gravity_index].y - this.y;
    float v_norm = sqrt(vector.x*vector.x+vector.y*vector.y)+0.01;
    vector.x /= v_norm;
    vector.y /= v_norm;

    if (game[gravity_index].mention > 0) {
      f.x+=gravity[gravity_index]*vector.x*0.05/game[gravity_index].mention;
      f.y+=gravity[gravity_index]*vector.y*0.05/game[gravity_index].mention;
      //f.x = vector.x/2;
      //f.y = vector.y/2;
    }
    if (f.x!=0) {
      a.x = 4*(f.x/abs(f.x))*log(abs(f.x)+1);
    }
    if (f.y!=0) {
      a.y = 4*(f.y/abs(f.y))*log(abs(f.y)+1);
    }
    if (Double.isNaN(a.x))println("a.x is NaN");
    if (Double.isNaN(a.y))println("a.y is NaN");

    vx/=friction;
    vy/=friction;
    vx+=a.x;
    vy+=a.y;
    Keyword kw = null;
    if (keywordConnection>=0 && dragging == true) {
      kw = (Keyword)keywords.get(keywordConnection);
    }
    if (kw!=this) {
      x+=vx;
      y+=vy;
    }


    //print(x);print(":");println(y);
  }

  void boundaryCollision() {
    if (x > m_x+m_width-r) {
      x = m_x+m_width-r;
      vx *= -1;
    } 
    else if (x < m_x+r) {
      x = m_x+r;
      vx *= -1;
    } 
    else if (y > m_y+m_height-r) {
      y = m_y+m_height-r;
      vy *= -1;
    } 
    else if (y < m_y+r) {
      y = m_y+r;
      vy *= -1;
    }
  }

  void draw() {
    //Connections
    if (keywordLegend.allow(type)) {
      draw_connections();
    }

    //Keyword Ellipse
    noStroke();
    ellipseMode(CENTER);
    fill(#4169E1, 30);
    //    noStroke();
    //print(x);print(",");println(y);
    ellipse(x, y, r*2, r*2);
    //    fill(0);
    //Keyword Text
    textAlign(CENTER);
    int s =(int) r;
    fill(#4169E1, 255);
    if (s>0) {
      textSize(s);
      textAlign(CENTER, CENTER);
      text(words, x, y);
    }
    showOriginalTweet();
  }

  void update(Game[] game, Date now, Date since) {
    if (keywordLegend.allow(type)) {
      float sum=0;
      float duration = (now.getTime() - since.getTime())/(1000.0*60);

      for (int i=0; i<game.length; i++ ) {
        if (duration>0) {
          //println(duration);
          int t = game[i].get_mention_time(now, since, this, i);
          gravity[i] = (1-alpha)*gravity[i]+alpha*t/duration*500;
        }
        //if(gravity[i]>5) gravity[i]=5;
        sum+=gravity[i]*2;
      }
      r = 4*log(sum+1);// words size
      m=r+0.1;
      //println(gravity);
    }
    else {
      r=0.01;
      
      m=0.01;
    }
  }



  void show_tweet() {
    if (tweet_text!=null) {
      String s = words + ": " + tweet_text;
      fill(0);
      textAlign(LEFT, TOP);
      textSize(14);
      text(s, m_x, m_y + m_height + 10);
    }
  }

  void draw_connections() {

    for (int i=0; i<num_game; i++) {
      noFill();
      stroke(#002366, 30);

      strokeWeight(0.5*log(gravity[i]+1));
      line(x, y, game[i].x, game[i].y);
    }
  }
  
  void showOriginalTweet(){
    if(showTweet>=0){
      Keyword kw = (Keyword)keywords.get(showTweet);
      if(kw==this){
        textSize(14);
        fill(#000080);
        textAlign(CENTER, TOP);
        text(kw.tweet_text, x, y+r);
      }
    }
  }
}

class KeywordLegend {
  String dis_keywords = "";
  ArrayList keyword_type = new ArrayList();
  float x = 1050;
  float y = 590;

  void add_keyword_type(String type) {
    keyword_type.add(type);
    dis_keywords+=type;
  }

  void display() {
    smooth();
    //    stroke(#FF4848, 90);
    fill(#4169E1, 130);
    strokeWeight(0.5);
    //    noStroke();
    fill(#4169E1, 10);
    rect(x, y, 132, (keyword_type.size()+1)*25);
    //    fill(#FFA5A5, 30);//pink
    fill(#000080, 50);
    rect(x, y, 132, 22);
    fill(30);
    textSize(15);
    textAlign(LEFT, TOP);
    text("Keywords  Filter", x+15, y+5);
    for (int i = 0; i<keyword_type.size(); i++) {
      fill(0, 125);
      textSize(13);
      textAlign(LEFT, CENTER);
      String t = (String)keyword_type.get(i);
      text(t, x+40, y+(i+1)*25+10);
      if (dis_keywords.contains(t)) {
        //        fill(255, 0, 0, 125);
        fill(#000080, 150);
      }
      else {
        noFill();
      }
      //         stroke(255,125);
      //      strokeWeight(2);
      stroke(150);
      ellipseMode(CENTER);
      ellipse(x+15, y+(i+1)*25+10, 10, 10);
    }
  }

  void click() {
    if (mouseX>x && mouseX<x+130 && mouseY>y && mouseY<y+(keyword_type.size()+1)*25-10) {
      for (int i = 0; i<keyword_type.size(); i++) {

        if (abs(mouseY - ((y+(i+1)*25)+10))<12.5 && mouseX>x && mouseX<x+200) {
          keywordConnection = -1;
          String t = (String)keyword_type.get(i);
          if (dis_keywords.contains(t)) {
            dis_keywords = dis_keywords.replaceAll(t, "");
          }
          else {
            dis_keywords += t;
          }
          //println(dis_keywords);
        }
      }

      for (int i=0; i<keywords.size(); i++) {
        Keyword kw = (Keyword)keywords.get(i);
        for (int j=0; j<num_game; j++) {
          kw.last_index[j] = game[j].last_index;
        }
      }

      tl.last_time = millis();
    }
  }

  boolean allow(String type) {
    return(dis_keywords.contains(type));
  }

  void clear() {
    dis_keywords = "";
  }
}

class RankInfo {
  Date time;
  int rank;

  RankInfo(String time, int rank) {
    SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");
    Date d = new Date();
    try {
      d = df.parse(time);
    }
    catch(Exception e) { 
      println(e);
    }
    this.time = d;
    this.rank = rank;
  }
}

class Timeline {
  float time=0;
  //float step_size;

  long last_time;
  long now_time;
  boolean running = false;
  boolean firstrun = true;


  float x = 80;
  float y_center = 780;
  float tl_height = 4;
  float tl_width = 1080; 

  Button play; 
  Button restart; 
  Button help;

  Date start_time;
  Date end_time;
  Date now;

  Timeline() {
    SimpleDateFormat df = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
    try {
      this.start_time = df.parse("Tue, 12 Nov 2012 19:00:00 -0500");
      this.end_time = df.parse("Fri, 29 Nov 2012 19:00:00 -0500");
    }
    catch(Exception e) {
      println(e);
    }

//    play = new Button(20, y_center, 10, loadImage("data/button/pause.png"));
//    restart = new Button(50, y_center, 10, loadImage("data/button/prev.png")); 
//    help = new Button(1180, y_center, 10, loadImage("data/button/help.png"));
    play = new Button(20, y_center, 10, loadImage("button/pause.png"));
    restart = new Button(50, y_center, 10, loadImage("button/prev.png")); 
    help = new Button(1180, y_center, 10, loadImage("button/help.png"));
    //last_time = millis();
  }

  void update() {
    now_time = millis();
    if (running == true) {
      //println(now_time);
      //println(last_time);
      if (!firstrun) {
        //println((now_time - last_time)/100000.0);
        if ((now_time - last_time)/100000.0 < 5 ) {
          time += (now_time - last_time)/100000.0;
        }
        if (time>=1) {
          time = 1;
          running = false;
        }
      }
    }
    firstrun = false;
    last_time = millis();
    now = new Date((long)(time*(end_time.getTime()-start_time.getTime())+start_time.getTime()));
    //println(now.toString());
  }

  void draw() {
    update();
    //println(time);
    noStroke();
    fill(125,50);
    rect(x, y_center-tl_height/2, tl_width, tl_height);

    fill(#4169E1);
    noStroke();
    rect(x, y_center-tl_height/2, (time)*tl_width, tl_height);



    //draw time text
    //fill(0);
    fill(0,0,128);
    SimpleDateFormat df = new SimpleDateFormat("HH:mm dd/MM/yyyy EEE");
    df.setTimeZone(TimeZone.getTimeZone("GMT-5"));
    textAlign(CENTER, BOTTOM);
    textSize(12);
    float text_x = (time)*tl_width+x;
    if(text_x < x + textWidth(df.format(tl.now))/2){
      text_x = x + textWidth(df.format(tl.now))/2;
    }else if(text_x > x + tl_width - textWidth(df.format(tl.now))/2){
      text_x = x + tl_width - textWidth(df.format(tl.now))/2;
    }
    
    text(df.format(tl.now), text_x, y_center-2);
    play.draw();
    restart.draw();
    help.draw();
  }

  void mousePress() {
    if (play.pressed()) {
      if (running) {
        running = false;
        play.icon = loadImage("button/play.png");
      }
      else {
        running = true;
        play.icon = loadImage("button/pause.png");
      }
    }
    else if (restart.pressed()) {
      toTime(0);
    }
    else if (help.pressed()) {
      introduction.showing = 0;
      tl.running = false;  
      underIntroduction = true;
    }
    else if (abs(mouseY - y_center) < tl_height/2) {
      if (mouseX>x && mouseX<x+tl_width) {
        float r = (mouseX-x)/tl_width;
        play.icon = loadImage("button/pause.png");
        toTime(r);
      }
    }
  }

  void toTime(float r) {
    time = r;
    now = new Date((long)(time*(end_time.getTime()-start_time.getTime())+start_time.getTime()));
    running = true;
    for (int i=0; i<num_game; i++) {
      SimpleDateFormat df = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
      try {
        game[i].since = df.parse("Tue, 12 Nov 2012 19:00:00 -0500");
      }
      catch(Exception e) {
        println(e);
      }
      game[i].last_index=0;
      game[i].mention =0;
      game[i].game_mention=0;
      //all tweet set to unscanned;
      for (int j=0; j<game[i].tweets.size(); j++) {
        Tweet t = (Tweet)(game[i].tweets.get(j));
        t.scanned = false;
      }
    }

    //clear keywords
    for (int i=0; i<keywords.size(); i++) {
      Keyword keyword = (Keyword)keywords.get(i);
      SimpleDateFormat df = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
      try {
        keyword.since = df.parse("Tue, 12 Nov 2012 19:00:00 -0500");
      }
      catch(Exception e) {
        println(e);
      }
      for (int j=0; j<num_game; j++) {
        keyword.last_index[j] = 0;
      }
    }


    tl.firstrun = true;
  }

  void pause() {
    if (running) {
      running = false;
    }
    else {
      running = true;
    }
  }
}

class Tweet {
  String original_text;
  String text;
  Date created_at;
  boolean scanned = false;

  Tweet(Date created_at, String text, String name) {
    
    this.original_text = text;
    String tw = text.toLowerCase();
    tw = tw.replace(name.toLowerCase(), "");
    this.text = tw;
    this.created_at = created_at;
  }
}

void initialize_games() {
  float r = 30;
  game[0] = new Game((m_x+m_width)/2, (m_y+m_height)/2, r, 0, 0, "angry bird", "birds.png", "RAngrybirds.csv");
  game[1] = new Game((m_x+m_width)/2, (m_y+m_height)/2, r, 0, 0, "Draw Something", "drawsomething.png", "RDrawsomething.csv" );
  game[2] = new Game((m_x+m_width)/2, (m_y+m_height)/2, r, 0, 0, "Fruit Ninja", "fruit.png", "RFruit.csv");
  game[3] = new Game((m_x+m_width)/2, (m_y+m_height)/2, r, 0, 0, "temple run", "templerun.png", "RTemplerun.csv");
  game[4] = new Game((m_x+m_width)/2, (m_y+m_height)/2, r, 0, 0, "Words With Friends", "wordswithfriends.png", "RWordswithfriends.csv");
  //game[5] = new Game((m_x+m_width)/2, (m_y+m_height)/2, r, 0, 0, "Bad Piggies", "bigpiggies.png", "RBadpiggies.csv");
  
  //game[6] = new Game((m_x+m_width)/2, (m_y+m_height)/2, r, 0, 0, "Flow Free", "flowfree.png", "RFlowfree.csv");
  //game[7] = new Game((m_x+m_width)/2, (m_y+m_height)/2, r, 0, 0, "Plants vs. Zombies", "plantszombies.png", "RPlantszombies.csv");
  //game[8] = new Game((m_x+m_width)/2, random(r, height-r), r, 0, 0, "Castle Story", "castlestory.png", "RCastlestorry.csv");
  
}

void initialize_keyword() {
  //  load_keyword_list("Action");
  load_keyword_list("Interaction");
  load_keyword_list("Feelings");
  load_keyword_list("Items");
  //  load_keyword_list("People");
  load_keyword_list("Rewards");
  load_keyword_list("Socialization");
//  load_keyword_list("Test");
}

void load_keyword_list(String type) {
  keywordLegend.add_keyword_type(type);
//  String[] l = loadStrings("data/keywords/"+type+".csv");
String[] l = loadStrings("keywords/"+type+".csv");
  //keyword = new Keyword[num_keyword];
  for (int i=0;i<l.length;i++) {
    float r = 18;
    String[] s = split(l[i], ',');

    Keyword keyword = new Keyword(s[0], s[1].charAt(0), type); 
    keyword.Keyword2Ball(random(r/2, width-r/2), random(r/2, height-r/2), r, random(-2, 2), random(-2, 2), r);

    keywords.add(keyword);
  }
}



