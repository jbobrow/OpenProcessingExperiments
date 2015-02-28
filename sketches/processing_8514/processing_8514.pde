
import ijeoma.motion.tween.*;

Tween t_r, t_g, t_b;

TweenGroup tweenGroup;

ArrayList tiles;
Boolean looping;
float _duration;
int s;
int anz;
int col;
int row;
void setup(){
  size(200, 200);
  looping = true;
  s = 20;
  preInitTiles();
}

void draw(){
  displayTiles();

}

void initTiles(){
  tiles = new ArrayList();
  for(int i = 0; i < anz; i++){
    int _rBegin = int(random(255));
    int _rEnd = int(random(255));

    int _gBegin = int(random(255));
    int _gEnd = int(random(255));

    int _bBegin = int(random(255));
    int _bEnd = int(random(255)); 
    
   _duration = random(1.8, 4.3);
   
  t_r = new Tween(this, "t_r", _rBegin, _rEnd, _duration, Tween.SECONDS, 0, Tween.CUBIC_EASE_IN);
  t_g = new Tween(this, "t_g", _gBegin, _gEnd, _duration, Tween.SECONDS, 0, Tween.CUBIC_EASE_IN);  
  t_b = new Tween(this, "t_b", _bBegin, _bEnd, _duration, Tween.SECONDS, 0, Tween.CUBIC_EASE_IN);
  tiles.add(new TweenGroup(this, "Tile_"+i, new Tween[]{t_r, t_g, t_b}));
     TweenGroup tweenGroup = (TweenGroup) tiles.get(i);
    tweenGroup.play();
  }
println(tiles.size());
}
void preInitTiles(){
  
  col = height/s;
  row = width/s;   
  anz = width/s*height/s;
  initTiles();
}

void displayTiles(){
  int count = 0;
  for(int i = 0; i < row; i++){
    for(int j = 0; j < col; j++){
   tweenGroup = (TweenGroup) tiles.get(count);
   int r = int(tweenGroup.getTween("t_r").getPosition());
  int g = int(tweenGroup.getTween("t_g").getPosition());
  int b = int(tweenGroup.getTween("t_b").getPosition());
  color col = color(r, g, b);
  fill(col);  
   rect(i*s, j*s, s, s);
   count++;
    }
  }
}

void keyPressed() {
  //println(keyCode);
  if(key == ' '){
  looping = !looping;
  if(looping){
    for(int i = 0; i < anz; i++){
      tweenGroup = (TweenGroup) tiles.get(i);
      tweenGroup.resume();
    }
    
  }else{
      for(int i = 0; i < anz; i++){
      tweenGroup = (TweenGroup) tiles.get(i);
      tweenGroup.pause();
    }
  }
  }
 
   if(key == '9'){
    s = 5;
    preInitTiles();
  }
   if(key == '0'){
    s = 10;
    preInitTiles();
  }
  if(key == '1'){
    s = 20;
    preInitTiles();
  }
   if(key == '2'){
    s = 25;
    preInitTiles();
  }
   if(key == '3'){
    s = 40;
    preInitTiles();
  } 
   if(key == '4'){
    s = 50;
    preInitTiles();
  }
   if(key == '5'){
    s = 100;
    preInitTiles();
  }  
   if(key == '6'){
    s = 200;
    preInitTiles();
  }   
}

Boolean chkTileList(TweenGroup _tg){
 for (int i = tiles.size()-1; i >= 0; i--) { 
  if(tiles.get(i) == _tg)return true;  
  }
  return false;
}


/// ***********************************//
// Tween Listener
/// ***********************************//
void tweenStartedEvent(Tween _t) {
  //println(_t + " started");
}

void tweenEndedEvent(Tween _t) {
 // println(_t + " ended");
}

void tweenGroupStartedEvent(TweenGroup _tg) {
  println("TweenGroup "+_tg.getName()+ " started");
}

void tweenGroupEndedEvent(TweenGroup _tg) {
//  println("TweenGroup "+_tg.getName() + " ended");
if(!chkTileList(_tg))return;
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  _tg.getTween("t_r").setBegin(_tg.getTween("t_r").getEnd());
  _tg.getTween("t_r").setEnd(r);
  _tg.getTween("t_g").setBegin(_tg.getTween("t_g").getEnd());
  _tg.getTween("t_g").setEnd(g); 
  _tg.getTween("t_b").setBegin(_tg.getTween("t_b").getEnd());
  _tg.getTween("t_b").setEnd(b); 
  _tg.play(); 
}

void tweenGroupResumedEvent(TweenGroup _tg) {
 // println(_tg + " resumed");
}

void tweenGroupPausedEvent(TweenGroup _tg) {
 // println(_tg + " paused");
}

void tweenGroupRepeatedEvent(TweenGroup _tg) {
 // println(_tg + " repeated");
}



