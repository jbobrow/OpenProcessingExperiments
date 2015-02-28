
int h = 300;
int w = 1000;

float density = (w*h)/350;

int seed_speed = 2;

int joint_distance = 20;

ArrayList<Seed> seeds = new ArrayList<Seed>();
ArrayList<Seed> joints = new ArrayList<Seed>();

ArrayList<Group> groups = new ArrayList<Group>();

Distractor[] distractors = {};

//color[] colors = {
//  color(65, 255, 217),
//  color(73, 251, 255),
//  color(255, 157, 2),
//  color(255, 251, 144),
//  color(255, 44, 224),
//  color(255, 83, 134)
//};

color[] colors = {
  color(209, 6, 199),
  color(8, 255, 212)
};

class Seed{
  int x;
  int y;
  float o;
  color c;
  Group g;

  int jump_count = 0;

  Seed parent;
  boolean start = true;
  boolean has_child = false;
  boolean reboot_me = false;
 
  Seed(){}
  
  void reboot(){
    this.x = int( w * random(1) );
    this.y = int( h * random(1) );
    this.o = random(0,360);
    
    boolean reboot = false;
    
    for(Seed joint: joints){
      if(this.distance_from(joint) < joint_distance){
        reboot = true;
      }
    }
    
    if(reboot && jump_count < 10){
      jump_count++;
      this.reboot();
    }
  }
  
  float distance_from(Seed s){
    return sqrt(sq(this.x - s.x) + sq(this.y - s.y));
  }

  void keep_in_screen(){
    this.x = (this.x + w) % w;
    this.y = (this.y + h) % h;    
  }
  
  void random_walk(){
    this.x += int(random(-3,3));
    this.y += int(random(-3,3));
  }

  void random_walk2(){
    this.o += random(-10,10);

    this.x += int( seed_speed * cos( radians( this.o) ) );
    this.y += int( seed_speed * sin( radians( this.o) ) );
  }

  boolean plant_check(){
    boolean check = false;

    boolean outside_distractors = true;

    for(int i = 0; i < distractors.length; i++){
      Distractor d = distractors[i];
      if(sqrt(sq(this.x - d.x) + sq(this.y - d.y)) < d.r){
         outside_distractors = false;
      }
    }

    if(outside_distractors){
      for(int i = 0 ; i < joints.size(); i++){
        Seed joint = joints.get(i);
        if(this.distance_from(joint) < joint_distance){
          this.plant(joint);
          check = true;
        }
      }
  
      if( this.plant_check_outside()){
        this.plant(new Seed());
        check = true;
      }
    }
  
    return check;
  }

  boolean plant_check_outside(){
    return (this.x < 0 || this.x > w || this.y < 0 || this.y > h);
  }

  void plant(Seed parent){
    Seed new_joint = new Seed();
    new_joint.x = this.x;
    new_joint.y = this.y;
    new_joint.start = false;
    new_joint.parent = parent;
    parent.has_child = true;

    if(parent.start == true){
//     new_joint.c = colors[int(random(0, colors.length))];
//     color c = color(
//       red(colors[0]) * (x/w)   + red(colors[1]) * (w - x)/w,
//       blue(colors[0]) * (x/w)  + blue(colors[1]) * (w - x)/w,
//       green(colors[0]) * (x/w) + green(colors[1]) * (w - x)/w
//     );
//    println(p);
     float p = float(this.x) / float(w);

     color c = color(
       red(colors[0])  * p  + red(colors[1])   * (1-p),
       green(colors[0])* p  + green(colors[1]) * (1-p),
       blue(colors[0]) * p  + blue(colors[1])  * (1-p)
     );

     new_joint.c = c;

     Group g = new Group(new_joint);
     groups.add(g);
     new_joint.g = g;
    } else {
      new_joint.c = parent.c;      
      new_joint.g = parent.g;      
    }

    new_joint.g.add(float(new_joint.x), float(new_joint.y));

    joints.add(new_joint);
    
    this.reboot();
  }
}

class Distractor {
  int x;
  int y;
  int r = 30;
  
  Distractor(int x,int y){
    this.x = x;
    this.y = y;
  }
}

class Group  {
  Seed origin;
  float[][] points = new float[0][2];
  
  Group(Seed origin){
    this.origin = origin;
  }
  
  void add(float x,float y){
    float[] p = new float[2];
    p[0] = x;
    p[1] = y; 
    this.points = (float[][]) append(this.points, p);
  }
}

void load_MLOVE(){

  Distractor[] ds = {
    new Distractor(362,216),
    new Distractor(360, 196),
    new Distractor(360, 173),
    new Distractor(361, 151),
    new Distractor(362, 131),
    new Distractor(362, 109),
    new Distractor(382, 121),
    new Distractor(399, 137),
    new Distractor(419, 151),
    new Distractor(436, 140),
    new Distractor(448, 123),
    new Distractor(462, 106),
    new Distractor(469, 135),
    new Distractor(469, 162),
    new Distractor(466, 184),
    new Distractor(469, 210),
    new Distractor(626, 225),
    new Distractor(609, 212),
    new Distractor(593, 194),
    new Distractor(581, 174),
    new Distractor(570, 153),
    new Distractor(568, 131),
    new Distractor(568, 111),
    new Distractor(583, 108),
    new Distractor(607, 106),
    new Distractor(624, 124),
    new Distractor(635, 140),
    new Distractor(655, 128),
    new Distractor(667, 114),
    new Distractor(681, 97),
    new Distractor(691, 114),
    new Distractor(698, 129),
    new Distractor(696, 147),
    new Distractor(687, 171),
    new Distractor(678, 191),
    new Distractor(668, 206),
    new Distractor(649, 218),
    new Distractor(636, 233)
  };

  //ds = MLOVE_alt();

  int x_min = w;
  int x_max = 0;
  int y_min = h;
  int y_max = 0;

  for(int i = 0; i < ds.length; i++){
    Distractor d = ds[i];

     x_min = min(x_min, d.x);
     x_max = max(x_max, d.x);
     y_min = min(y_min, d.y);
     y_max = max(y_max, d.y);    
  }

  for(int i = 0; i < ds.length; i++){
    Distractor d = ds[i];
    d.x = d.x - x_min + (w - (x_max - x_min))/2;
    d.y = d.y - y_min + (h - (y_max - y_min))/2;
    
  }  
  
  distractors = ds;
}

Distractor[] MLOVE_alt(){
Distractor[] ds = {
new Distractor(295, 207 ),
new Distractor(294, 188 ),
new Distractor(294, 163 ),
new Distractor(294, 140 ),
new Distractor(292, 120 ),
new Distractor(292, 101 ),
new Distractor(311, 96 ),
new Distractor(331, 97 ),
new Distractor(353, 97 ),
new Distractor(368, 97 ),
new Distractor(389, 97 ),
new Distractor(411, 97 ),
new Distractor(432, 97 ),
new Distractor(455, 97 ),
new Distractor(480, 98 ),
new Distractor(496, 98 ),
new Distractor(516, 98 ),
new Distractor(410, 119 ),
new Distractor(410, 137 ),
new Distractor(409, 156 ),
new Distractor(409, 170 ),
new Distractor(409, 190 ),
new Distractor(409, 215 ),
new Distractor(519, 120 ),
new Distractor(518, 144 ),
new Distractor(521, 177 ),
new Distractor(521, 201 ),
new Distractor(517, 163 ),
new Distractor(523, 227 ),
new Distractor(640, 109 ),
new Distractor(654, 96 ),
new Distractor(680, 93 ),
new Distractor(704, 107 ),
new Distractor(723, 124 ),
new Distractor(745, 114 ),
new Distractor(758, 99 ),
new Distractor(779, 88 ),
new Distractor(800, 93 ),
new Distractor(811, 111 ),
new Distractor(809, 133 ),
new Distractor(792, 158 ),
new Distractor(781, 183 ),
new Distractor(764, 208 ),
new Distractor(749, 222 ),
new Distractor(729, 228 ),
new Distractor(706, 217 ),
new Distractor(691, 203 ),
new Distractor(678, 181 ),
new Distractor(661, 163 ),
new Distractor(644, 138 )
};
return ds;
}

void setup(){
  size(w,h);
  background(0);

  for(int i = 0; i < 20; i++){
    Seed s = new Seed();
    s.reboot();
    seeds.add(s);
  }

  load_MLOVE();

  //noSmooth();
  smooth();
}

void draw(){
  background(0);
  
  boolean play_sound = false;
  
  noStroke();
  for(int i = seeds.size() - 1; i >= 0 ; i--){
    Seed s = seeds.get(i);
    if(s.plant_check()){
      play_sound = true;
      //out.playNote(0, 0.1,"C4");
      seeds.remove(i);
    } else {
      s.random_walk2();
    }
  }
  
  //draw_distractors();
  // draw_hull();
  // draw_voronoi();

  stroke(90);
  for(int i = 0; i < seeds.size(); i++){
    Seed s = seeds.get(i);
    noStroke();
    fill(90);
    //ellipse(s.x, s.y, 5, 5);
    triangle(
      s.x + 5 * cos(radians(s.o)), s.y + 5 * sin(radians(s.o)),
      s.x + 5 * cos(radians(s.o + 120)), s.y + 5 * sin(radians(s.o + 120)),
      s.x + 5 * cos(radians(s.o - 120)), s.y + 5 * sin(radians(s.o - 120))
    );

    stroke(90);
    for(int j = i; j < seeds.size(); j++){
      Seed s2 = seeds.get(j);
      if( s.distance_from(s2) < 60){
        strokeWeight(1);
        line(s.x, s.y, s2.x, s2.y);
//        play_sound = true;
      }
    }
  }


  for(Seed joint : joints){
    if(!joint.has_child){
      noStroke();
      fill(joint.c);
      // ellipse(joint.x, joint.y, 5, 5);
    }

    if(!joint.parent.start){
      //line(joint.x, joint.y, joint.parent.x, joint.parent.y);

      float d = joint.distance_from(joint.parent)/2;
      float a = atan2(joint.parent.y - joint.y, joint.parent.x - joint.x);
      float a2= PI/4;

      noStroke();
      fill(joint.c);
      triangle(
        joint.x, joint.y,
        joint.x + d * cos(a) + 5 * cos(a+PI/2), joint.y + d * sin(a) + 5 * sin(a+PI/2),
        joint.x + d * cos(a) + 5 * cos(a-PI/2), joint.y + d * sin(a) + 5 * sin(a-PI/2)
      );
      fill(red(joint.c) + 80, green(joint.c) + 80, blue(joint.c) + 80);
      triangle(
        joint.parent.x, joint.parent.y,
        joint.parent.x - d * cos(a) + 5 * cos(a+PI/2), joint.parent.y - d * sin(a) + 5 * sin(a+PI/2),
        joint.parent.x - d * cos(a) + 5 * cos(a-PI/2), joint.parent.y - d * sin(a) + 5 * sin(a-PI/2)
      );

      stroke(red(joint.c) - 80, green(joint.c) - 80, blue(joint.c) - 80);
      line(joint.x, joint.y, joint.parent.x, joint.parent.y);
    }
  }

  if(joints.size() < density){
    if(seeds.size() <= 20){
      for(int i = 20 - seeds.size(); i >= 0; i--){
        Seed s = new Seed();
        s.reboot();
        seeds.add(s);
      }
    }
  }

  //println("s : " + seeds.size());
  //println("j : " + joints.size());
}

void draw_voronoi(){
  float[][] points = new float[0][2];

  for(int i = 0; i < joints.size() ; i++){
    float[] p = new float[2];
    p[0] = joints.get(i).x;
    p[1] = joints.get(i).y;
    points = (float[][]) append(points, p);
  }

  for(int i = 0; i < seeds.size() ; i++){
    float[] p = new float[2];
    p[0] = seeds.get(i).x;
    p[1] = seeds.get(i).y;
    points = (float[][]) append(points, p);
  }
  
  for(int i = 0; i < points.length; i++){
    for(int j = 0; j < i; j++){
      if(points[i][0]==points[j][0]&&points[i][1]==points[j][1]) {
        points[i][0]+=random(1);
        points[i][1]+=random(1);
        points[j][0]-=random(1);
        points[j][1]-=random(1);
      }
    } 
  }

  println(points.length);
  Voronoi v = new Voronoi( points );

  MPolygon[] regions = v.getRegions();

  for(int i=0; i<regions.length; i++){
    // an array of points
    float[][] regionCoordinates = regions[i].getCoords();
    
    stroke(90);
    fill(0,0,0);
    regions[i].draw(this); // draw this shape
  }

}

void draw_distractors(){
  for(int i = 0; i < distractors.length ; i++ ){
    Distractor d = distractors[i];
    stroke(255);
    noFill();
    
    ellipse(d.x, d.y, d.r, d.r);
  }
}

void draw_hull(){
  for(int n = 0; n < groups.size(); n++){

    Group g = groups.get(n);
    
    float[][] points = g.points;
    
    for(int i = 0; i < points.length; i++){
      for(int j = 0; j < i; j++){
        if(points[i][0]==points[j][0]&&points[i][1]==points[j][1]) {
          points[i][0]+=random(2);
          points[i][1]+=random(2);
          points[j][0]-=random(2);
          points[j][1]-=random(2);
        }
      }
    }
    
    Hull h = new Hull(points);
    MPolygon myRegion = h.getRegion();
    noStroke();
    fill(g.origin.c);
    myRegion.draw(this);
  }
}

void mousePressed(){
  
  Seed s = new Seed();
  s.x = mouseX;
  s.y = mouseY;
  s.o = random(0,360);

  seeds.add(s);

//  distractors = (Distractor[]) append(distractors, new Distractor(mouseX, mouseY));
//  println("new Distractor("+mouseX+", "+mouseY+");");
}

void keyPressed(){
  if(key == 'r'){
    joints = new ArrayList<Seed>();
  }
  
  if(key == 'a'){
    Seed s = new Seed();
    s.reboot();
    seeds.add(s);
  }
  
  if(key == 'd'){
    print_distractors();
  }

  if(key == 's'){
    save_png();
  }
}

void print_distractors(){
  println("{");
  for(int i = 0; i < distractors.length; i++){
    Distractor d = distractors[i];
    println("new Distractor("+d.x+", "+d.y+" ),");
  }
  println("}");
}

void save_png(){
  save("current.png");
}
