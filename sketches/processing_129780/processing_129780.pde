
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");

float[] angle, rad, speed, x, y, diam;
int[] nbConnex;
int nbPts;
final static int RADIUS = 90;

void setup() {
    size(1000, 800, P2D);
    smooth();
    initialize();
}

void initialize(){
    nbPts = int(random(30,150));
    angle = new float[nbPts];
    a = new float[nbPts];
    rad = new float[nbPts];
    speed = new float[nbPts];
    x = new float[nbPts];
    y = new float[nbPts];
    diam = new float[nbPts];
    nbConnex = new int[nbPts];
    for (int i = 0; i<nbPts; i++) {
        angle[i] = random(TWO_PI);
        rad[i] = int(random(1, 5)) * RADIUS;
        speed[i] = random(-.01, .01);
        x[i] = width/2;
        y[i] = height/2;
        nbConnex[i] = 0;
        diam[i] = 0;
    }
}

void draw() {
    externals.context.clearRect(0,0,width,height);

    stroke(0, 50);
    for (int i=0; i<nbPts-1; i++) {
        for (int j=i+1; j<nbPts; j++) {
            if (dist(x[i], y[i], x[j], y[j])<RADIUS+10) {
                line(x[i], y[i], x[j], y[j]);
                nbConnex[i]++;
                nbConnex[j]++;
            }
        }
    }

    noStroke();
    for (int i=0; i<nbPts; i++) {
        angle[i] += speed[i];
        x[i] = ease(x[i], width/2 + cos(angle[i]) * rad[i], 0.1);
        y[i] = ease(y[i], height/2 + sin(angle[i]) * rad[i], 0.1);
        diam[i] = ease(diam[i], min(nbConnex[i], 7)*(rad[i]/RADIUS), 0.1);
        fill(0, 100);
        ellipse(x[i], y[i], diam[i] + 16, diam[i] + 16);
        fill(0);
        ellipse(x[i], y[i], diam[i] + 5, diam[i] + 5);

        nbConnex[i] = 0;
    }
}

void mousePressed() {
    initialize();
}

float ease(float variable, float target, float easingVal) {
    float d = target - variable;
    if (abs(d)>1) variable+= d*easingVal;
    return variable;
}
