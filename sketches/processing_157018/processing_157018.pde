
/* @pjs transparent=true; */
// the above line and the following make the background transparent
if(typeof document != 'undefined'){
  var inside = document.getElementById("appletAjaxContainer"),
    outside = parent.document.getElementById("appletAjaxContainer"),
    body = document.getElementsByTagName('body');
  if(outside){
    outside.setAttribute("style", "background-color:transparent; border:0px;");
  }
  if(inside){
    inside.setAttribute("style", "background-color:transparent; border:0px;");
  }
  if(body){
    // make the bg red so we can see the transparency
    body[0].setAttribute("style", "background-color: transparent; background-image: none;");
  }
}

var done = 0, limit = 162;

// N lines
int num =6;

float step, spacing, offSet, theta, angle, startPosition;

void setup() {
  size(125, 125);
  
  // Linewidth
  strokeWeight(5);
  noFill();
  // Line color
  stroke(221,221,209);
  
  // Spacing 
  step = 22;
  startPosition = -(PI/2);
}

void draw() {
  //background(43);
  background(0, 0, 0, 0);
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    spacing = i*step;
    // ofset in radians
    float offSet = (PI/3/num)*i;
    
    // end point of arch in radians
    angle = (theta+offSet) % PI;
    float arcEnd = map(sin(angle),-1,1, -TWO_PI, TWO_PI);
    
    
    if(angle <= (PI/2) ) {
        // (Centre of circle | Width and height in px | radians start and stop )
        arc(0, 0, spacing, spacing, 0+startPosition , arcEnd+startPosition );
    }
    else {
        arc(0, 0, spacing, spacing, TWO_PI-arcEnd+startPosition , TWO_PI+startPosition );
    }
  }
  // Static for center dot
  arc(0, 0, 1, 1, 0, TWO_PI);

  if(done < limit){
    done++;
    //saveFrame("spinner-####.png");
  }
  
  if(done >= limit){
    exit();
  }

  //animation speed
  theta += .02;
  
}
