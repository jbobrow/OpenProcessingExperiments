
MyPoint[] pts;
PImage img;
int nbW = 50, nbH = 25;

var ctx;
var video = document.createElement("video");
video.setAttribute("style", "display:none;");
video.setAttribute("id", "videoOutput");
video.setAttribute("width", "500px");
video.setAttribute("height", "660px");
video.setAttribute("autoplay", "true");
if(document.body!=null) document.body.appendChild(video);
 
function init() {
    if (navigator.webkitGetUserMedia) {
        navigator.webkitGetUserMedia({video:true}, gotStream, noStream);
 
        function gotStream(stream) {
            video.src = webkitURL.createObjectURL(stream);
            video.onerror = function () {
                stream.stop();
                streamError();
            };
        }
 
        function noStream() {
            alert("No camera available.");
        }
 
        function streamError() {
            alert("Camera error.");
        }
    }
}

void setup(){
    size(400, 250, P3D);//OPENGL
    ctx = externals.context;
    smooth(8);
    init();
    initialize();
    stroke(0, 80);
}

void initialize()
{
    pts = new MyPoint[nbW*nbH];
    for(int j=0; j<nbH; j++){
        for(int i=0; i<nbW; i++){
           pts[i + j*nbW] = new MyPoint(new PVector(i * width/nbW, j * height/nbH));
        }
    }
}

void draw(){
    pushMatrix();
    translate(width, 0);
    scale(-1,1);//mirror the video
    ctx.drawImage(video, 0, 0, width, height); //video is defined outside processing code
    popMatrix();
 
    img = get();
    img.resize(nbW, nbH);
    background(255);
    
    beginShape(TRIANGLES);
    //beginShape(QUAD);
    //texture(img);
    PVector a, b, c, d;
    float x1, x2, y1, y2;
    for(int j=0; j<nbH; j++){
        for(int i=0; i<nbW; i++){
            if(j<nbH-1 && i<nbW-1) 
            {           
            a = pts[i + j*nbW].pos;
            b = pts[i+1 + j*nbW].pos;
            c = pts[i+1 + (j+1)*nbW].pos;
            d = pts[i + (j+1)*nbW].pos;
              
            x1 = (a.x + b.x + d.x) / 3;
            x2 = (b.x + c.x + d.x) / 3;
            y1 = (a.y + b.y + d.y) / 3;
            y2 = (b.y + c.y + d.y) / 3;
            
            fill(img.get(int(x1/width*nbW), int(y1/height*nbH)));
            vertex(a.x, a.y);
            vertex(b.x, b.y);
            vertex(d.x, d.y);
            
            fill(img.get(int(x2/width*nbW), int(y2/height*nbH)));
            vertex(b.x, b.y);
            vertex(c.x, c.y);
            vertex(d.x, d.y);            
            /*
            vertex(a.x, a.y, int(a.x/width*nbW), int(a.y/height*nbH));
            vertex(b.x, b.y, int(b.x/width*nbW), int(b.y/height*nbH));
            vertex(c.x, c.y, int(c.x/width*nbW), int(c.y/height*nbH));
            vertex(d.x, d.y, int(d.x/width*nbW), int(d.y/height*nbH));
            */
            }
            pts[i + j*nbW].process();
        }
    }
    endShape();
}

class MyPoint
{
  final static float MAX_DIST_MOUSE = 80;//mouse influence zone
  final static float FRICTION_AIR = .92;//'air' FRICTION_AIR
  PVector target;//original position, MyPoint always tries to get back to it
  PVector f = new PVector(0, 0);//force applied to the point
  PVector pos, tmpv;
  int countExclude;

  MyPoint(PVector p_p)
  {
    pos = p_p;
    target = pos.get();
  }

  void process()
  {
    f.mult(FRICTION_AIR);   
    float d = dist(pos.x, pos.y, mouseX, mouseY);
    if (d < 6) d = 6;//prevent erratic behavior
    if (d < MAX_DIST_MOUSE)//mouse effect
    {
      tmpv = new PVector(mouseX, mouseY);
      tmpv.sub(pos);
      float a = 0.83 * cos(map(d, 0, MAX_DIST_MOUSE, 0, HALF_PI));
      tmpv.mult((mousePressed ? -1 : 1) * a / d);
      f.add(tmpv);
    }
    
    //attracted to its original position
    tmpv = target.get();
    tmpv.sub(pos);
    tmpv.mult(.03);
    f.add(tmpv);    
    pos.add(f);   
  }
}
