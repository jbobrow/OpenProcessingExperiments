
int counter;

UnfoldingMap map;

void setup() {
    size (800, 600, P2D);
    
   map = new UnfoldingMap(this);
   MapUtils.createDefaultEventDispatcher(this, map);
   }
 void draw(){
     map.draw();
     }
