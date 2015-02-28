
int levels = 0;
int maxLvl= 10;
ArrayList<Line> lines = new ArrayList<Line>();
boolean increasing = true;

void setup() {  //setup function called initially, only once
  frameRate(2);
  size(800, 800);
  background(255);  //set background white
  colorMode(HSB, 360, 100, 100);   //set colors to Hue, Saturation, Brightness mode
  strokeWeight(1);
}

void draw() {  //draw function loops
    background(0); 
    lines = new ArrayList<Line>();
    lines.add(new Line(new PVector(100, height*.6), new PVector(width-200, height*.6), -1));

    for(int i = 0; i < levels; i++){
        recurse();
    }
    float fill = 0;
    for(Line l : lines){
      stroke(fill,100,100);
      l.render();
      fill+=360/lines.size();
    }    
    
    if(increasing==true){
        levels++;
    } else {
        levels--;
    }
    
    if(levels >= maxLvl){
        levels = maxLvl-1;
        increasing = false;
    }    
    
    if(levels<= 0){
        levels = 1;
        increasing = true;
    }
}

void keyPressed(){
    if(keyCode==RIGHT){
        levels++;
    } else if (keyCode==LEFT){
        levels--;
    }
}

void recurse(){
    int linesLength = lines.size();
    for(int i = 0; i < linesLength; i++){
        PVector point = new PVector.sub(lines.get(0).end, lines.get(0).start);
        point.mult(.5);
        point.add(new PVector(-point.y*lines.get(0).facing, point.x*lines.get(0).facing));
        point.add(lines.get(0).start);
        lines.add(new Line(lines.get(0).start, point, 1));
        lines.add(new Line(point, lines.get(0).end,-1));
        lines.remove(0);
    }
}


void keyPressed(){
    if(key==CODED){
        if(keyCode == RIGHT){
            levels++;
        }
        if(keyCode==LEFT){
            levels--;
        }
    }
}

class Line{
    PVector start;
    PVector end;
    int facing;
    
    public Line(PVector start_, PVector end_, int facing_){
        start = start_;
        end = end_;
        facing = facing_;
    }
    
    void render(int a, int b){
        line(start.x, start.y, end.x, end.y);
    }
}
