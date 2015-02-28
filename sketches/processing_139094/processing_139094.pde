
//test

var xmlHttp;

ArrayList<Sketch> sketches;

void setup() {  //setup function called initially, only once
  size(600, 400);
  background(0);
  frameRate(5);
  textSize(16);

//  console.log("start");

  sketches = new ArrayList();
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      sketches.add( new Sketch((i+0.5)*width/3-50, j*height/3) );
    }
  }

  for (int i=0; i<sketches.size(); i++) {
    sketches.get(i).loadData();
  }
}

void draw() {
  background(0);
  for (int i=0; i<sketches.size(); i++) {
    sketches.get(i).draw(i);
    if(sketches.get(i).div != null) {
//      console.log(i+" "+ sketches.get(i).div );
    }
  }
}


class Sketch {
  PImage img;
  var doc;
  var div;
  var li;
  var imgUrl;
  var title;
  var xmlHttp;
  int num;
  float x;
  float y;
  float s = 100;
  boolean isReady;
  int startTime;
  int waitFor = 4000;
  
  Sketch( float x, float y) {
    this.x = x;
    this.y = y;
    this.xmlHttp=new XMLHttpRequest();
    isReady = false;
    startTime = millis();
  }

  void checkMe() {
      if(img!=null) {
          if(mouseX>x && mouseY>y && mouseX<x+100 && mouseY<y+100) {
              link("/sketch/"+num, "_blank");
          }
      }
  }

  void draw(int i) {
      strokeWeight(1);
      stroke(255);
      fill(255);
      textAlign(CENTER, TOP);
      if(img!=null) {
          image(img,x,y,100,100);
          text(title.substr(0,20), x+50, y+100);
          if(mouseX>x && mouseY>y && mouseX<x+100 && mouseY<y+100) {
              strokeWeight(4);
              stroke(255,120,0);
//              cursor(HAND); somday i'll do this :)
          }
      }
      else {
          text("LOADING...", x+50, y+100);
      }
      noFill();
      rect(x,y,100,100, 5, 5);
      if( startTime+waitFor<millis() ) {
        if(div==null) {
          loadData();
        }
      }
      if(div!=null && li==null) {
          imgUrl="/sketch/thumbnail/"+num;
          img = loadImage(imgUrl);
          var lis = div.children;
          for(int j=0; j<lis.length; j++) {
              c=lis[j].className;
              if(c=="visThumbnail50 selected") {
                  li = lis[j];
                  title = li.getElementsByTagName('img')[0].alt;
              }
          }
      }
  }


  void loadData() {
    startTime=millis();
    num = int(random(145000));
    var url="/sketch/"+num;
    xmlHttp.open("GET", url, true);
    console.log("requestset");
    xmlHttp.onreadystatechange = function() {
      if (xmlHttp.readyState == 4 && xmlHttp.status == 404) {
          loadData();
          console.log("404 - retry...");
      }
      if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
        doc = par(xmlHttp.responseText);
        console.log(doc);
        console.log(this.doc);
        div = doc.getElementById("browseModule");
        console.log("div: "+this.div);
      }
    }
    xmlHttp.send();
  }
}

void mouseClicked() {
//    console.log("CLICK");
    for (int i=0; i<sketches.size(); i++) {
      sketches.get(i).checkMe();
    }
}

void keyPressed() {
  if(key == 'r') {
    for (int i=0; i<sketches.size(); i++) {
      sketches.get(i).div=null;
      console.log(sketches.get(i).div);
      sketches.get(i).img=null;
      sketches.get(i).startTime = millis();
      sketches.get(i).loadData();
      sketches.get(i).xmlHttp=new XMLHttpRequest();
    }
  }
}

function par(txt) {
  parser=new DOMParser();
  htmlDoc=parser.parseFromString(txt, "text/html");
  return htmlDoc;
}
