
Body mybody1;
Arms myarml, myarmr;
void setup(){
size(800, 600);
background(0)
mybody1 = new Body(50, 50, 150, 100);
myarml =  new Arms(20, 10);
}
void draw(){
mybody1.render();
myarml.render();
}
class Body{
    int x, y, w, h;
    Body(int tempx, int tempy, int tempw, int temph){
        x = tempx;
        y = tempy;
        w = tempw;
        h = temph;
        }
    }
    class Arms extends Body{
        Arms(int aw, int ah){
          super(x, y);
            }
        }
        void render(){
            rect(x, y, w, h);
        }
}
