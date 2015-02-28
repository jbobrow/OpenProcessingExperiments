
// Attaching js code to the canvas by using a sketch object

var sketch = new Processing.Sketch();

sketch.use3DContext = true;


//this code is not very well arranged. actually piece of shit.. 



sketch.attachFunction = function(processing){
  var img;

  var top;
  var bottom;
  var axis;

  var topPs;
  var bottomPs;

  var sceneAngX;
  var sceneAngY;

  var cardAng;

  var w,h;

  var oldMouseY;

  //ring

  var smallR;
  var largeR;

  var diaR;

  var ang;
  
  var smalls;
  var larges;
  var diamonds;

  var particles;

  var testP;

  var s;
  var u;

  var r;
  var a;
  var f;

  processing.setup = function(){
try{
    processing.size(1000, 800, processing.OPENGL);
  }catch(err){
    window.alert("I really hate to say this,but it is not gonna work in this browser. Try browser with WeblGL enabled.")
  }
    topPs = new Array();
    bottomPs = new Array();

    s = new Array();
    u = new Array();

    r = new Array();
    a = new Array();
    f = new Array();

  s.push(new processing.PVector(0,0,0));
  s.push(new processing.PVector(11,0,0));
  s.push(new processing.PVector(11,10,0));
  s.push(new processing.PVector(0,11,0));
  s.push(new processing.PVector(0,21,0));
  s.push(new processing.PVector(10,21,0));
  
  
  u.push(new processing.PVector(32,23,0));
  u.push(new processing.PVector(33,0,0));
  u.push(new processing.PVector(44,0,0));
  u.push(new processing.PVector(44,23,0));

  r.push(new processing.PVector(0,0,0));
  r.push(new processing.PVector(0,23,0));
  r.push(new processing.PVector(10,23,0));
  r.push(new processing.PVector(10,12,0));
  r.push(new processing.PVector(0,11,0));
  r.push(new processing.PVector(10,0,0));
  
  
  a.push(new processing.PVector(20,0,0));
  a.push(new processing.PVector(20,21,0));
  a.push(new processing.PVector(30,20,0));
  a.push(new processing.PVector(30,0,0));
  a.push(new processing.PVector(20,11,0));
  a.push(new processing.PVector(30,11,0));
  
  f.push(new processing.PVector(45,1,0));
  f.push(new processing.PVector(45,21,0));
  f.push(new processing.PVector(56,20,0));
  f.push(new processing.PVector(44,11,0));
  f.push(new processing.PVector(55,11,0));



    w = 290;
    h = 170;

    cardAng = 0;

    for(var i =0; i<4;i++){
      topPs.push(new processing.PVector(100,100,100));
    }
    for(var i =0; i<4;i++){
   //   bottomPs.push(new processing.PVector(100,100,100);
    }

    axis = new processing.PVector(0,0,0);
    particles = new Array();

    for (var i = 0; i<= 50; i++) {
      var pa = new Particle();
      particles.push(new Particle());

    }
    testP = new Particle();
  
  //rings
  
  smallR = 50.0;
  largeR = 65.0;
  
  diaR = 20.0;

  ang = Math.PI/8;


  smalls = new Array();
  larges = new Array();
  
  
  diamonds = new Array();

  for (var i = 0; i<= Math.PI*2; i+=ang) {
    smalls.push(new processing.PVector(Math.cos(i)*smallR*processing.random(0.7,1), Math.sin(i)*smallR*processing.random(0.8,1),0));
    smalls.push(new processing.PVector(Math.cos(i+ang/2)*largeR*processing.random(0.85,1), Math.sin(i+ang/2)*largeR*processing.random(0.85,1),0));
  }
  
  var p0 = smalls[0];
  var p1 = smalls[1];
  
    smalls.push(p0);
    smalls.push(p1);


  
  var diaCenter = new processing.PVector(Math.cos(Math.PI*3.0/2.0)*largeR,Math.sin(Math.PI*3.0/2.0)*largeR,0);
  
  
  for(var i=0; i<6; i+= Math.PI/3.0){
    
    diamonds.push(new processing.PVector(diaCenter.x+Math.cos(i)*diaR*processing.random(0.65,1), 5+diaCenter.y+Math.sin(i)*diaR*processing.random(0.65,1),2));
    
  }
  
  
    for (var i = 0; i<= Math.PI*2; i+=ang) {
    larges.push(new processing.PVector(smallR*3/2+Math.cos(i)*smallR*processing.random(0.7,1), Math.sin(i)*smallR*processing.random(0.8,1),Math.sin(i+ang/2)*smallR/20.0));
    larges.push(new processing.PVector(smallR*3/2+Math.cos(i+ang/2)*largeR*processing.random(0.85,1), Math.sin(i+ang/2)*largeR*processing.random(0.85,1),Math.sin(i+ang/2)*smallR/20.0));
  }
  
  
    var pp0 = larges[0];
    var pp1 = larges[1];
  
    larges.push(pp0);
    larges.push(pp1);



     top = new processing.PVector(0,h,0);
 
     bottom = new processing.PVector(0,h,0);

    processing.smooth();
  };

  processing.draw = function(){
    cardAng = processing.constrain(cardAng,0.15,Math.PI*3/4);
    bottomAng = Math.PI + cardAng;

       bottomPs[0] = new processing.PVector(axis.x-w/2, axis.y, axis.z);
       bottomPs[1] = processing.PVector.add(bottomPs[0], bottom);

       bottomPs[3] = new processing.PVector(axis.x+w/2, axis.y, axis.z);
       bottomPs[2] = processing.PVector.add(bottomPs[3], bottom);

       topPs[0] = new processing.PVector(axis.x-w/2, axis.y, axis.z);
       topPs[1] = processing.PVector.add(topPs[0], top);

       topPs[3] = new processing.PVector(axis.x+w/2, axis.y, axis.z);
       topPs[2] = processing.PVector.add(topPs[3], top);

        var topVec = new processing.PVector(0, (h/3)*Math.cos(cardAng), (h/3)*Math.sin(cardAng));
        var bottomVec = new processing.PVector(0, (h/3)*Math.cos(0), (h/3)*Math.sin(0));

        var popVec= processing.PVector.add(topVec, bottomVec);
        var popDown = processing.PVector.sub(popVec, bottomVec);
        var popUp = processing.PVector.sub(popVec, topVec);




       processing.background(0);

          if(cardAng > Math.PI/5){
            for(var i=0; i<particles.length;i++){
     
             particles[i].move();
             particles[i].display(); 
    
           }
         }

        processing.fill(255);
      processing.strokeWeight(3);
      processing.stroke(50);
       processing.translate(processing.width/2,processing.height/2+30,100+cardAng*40);
       processing.rotateX(sceneAngY+Math.PI/3);
       processing.rotateZ(sceneAngX);
  


        processing.pushMatrix();
        processing.rotateX(cardAng+0.05);
        processing.beginShape(processing.QUADS);

          for (var i = 0; i < bottomPs.length; i++) {
           processing.vertex(bottomPs[i].x, bottomPs[i].y, bottomPs[i].z);
         }
         processing.endShape();
          processing.popMatrix();

     
         processing.pushMatrix();
         processing.beginShape(processing.QUADS); 

          for (var i = 0; i < topPs.length; i++) {
            processing.vertex(topPs[i].x, topPs[i].y, topPs[i].z);
          }

          processing.endShape();
          processing.popMatrix();

          processing.pushMatrix();
          processing.translate(bottomVec.x,bottomVec.y-20,bottomVec.z);
          var magg = popDown.mag();
          processing.rotateX(processing.PVector.angleBetween(bottomVec, popDown)+Math.PI);
         // processing.image(img,0,0);

          //ring drawing part

           processing.strokeWeight(2);
          processing.stroke(105);
  
          processing.fill(235,210,210);

          processing.beginShape(processing.TRIANGLE_STRIP);
          for(var i = 0; i<smalls.length; i++){
           processing.vertex(smalls[i].x-smallR,smalls[i].y-largeR+5,smalls[i].z); 
          }
          processing.endShape();

          processing.beginShape();
        
         for(var i = 0; i<diamonds.length; i++){ 

          processing.vertex(diamonds[i].x-smallR,diamonds[i].y-largeR+5,diamonds[i].z); 

          }
  
          processing.endShape(processing.CLOSE);
  
          processing.fill(200,205,230);
  
        processing.beginShape(processing.TRIANGLE_STRIP);
        for(var i = 0; i<larges.length;i++){ 
         processing.vertex(larges[i].x-smallR,larges[i].y-largeR+5,larges[i].z); 
        }
          processing.endShape();
          processing.popMatrix();

          processing.stroke(5);
          processing.strokeWeight(3);

          processing.pushMatrix();
          processing.translate(bottomVec.x-95,bottomVec.y+50,bottomVec.z+15);
          var magg = popDown.mag();
          processing.rotateX(processing.PVector.angleBetween(bottomVec, popDown));

 for(var i=0; i<s.length-1;i++){
  
   var p1 = s[i];
   var p2 = s[i+1];
   
   processing.line(p1.x,p1.y,p1.z,p2.x,p2.y,p2.z);
  
 } 
 
  for(var i=0; i<u.length-1;i++){
  
   var p1 = u[i];
   var p2 = u[i+1];
   
   processing.line(p1.x,p1.y,p1.z,p2.x,p2.y,p2.z);
  
 } 

          processing.popMatrix();

          processing.pushMatrix();
          processing.translate(bottomVec.x+55,bottomVec.y+50,bottomVec.z+5);
          var magg = popDown.mag();
          processing.rotateX(processing.PVector.angleBetween(bottomVec, popDown));

         for(var i=0; i<r.length-1;i++){
          
           var p1 = r[i];
           var p2 = r[i+1];
           
           processing.line(p1.x,p1.y,p1.z,p2.x,p2.y,p2.z);
          
         } 
         
          for(var i=0; i<a.length-1;i++){
          
           var p1 = a[i];
           var p2 = a[i+1];
           
           processing.line(p1.x,p1.y,p1.z,p2.x,p2.y,p2.z);
          
         } 

          for(var i=0; i<f.length-1;i++){
          
           var p1 = f[i];
           var p2 = f[i+1];
           
           processing.line(p1.x,p1.y,p1.z,p2.x,p2.y,p2.z);
          
         } 

          processing.popMatrix();


         processing.fill(255);
         processing.pushMatrix();
         processing.translate(topVec.x, topVec.y, topVec.z);
        var maggg = popUp.mag();
  //rotateX(PVector.angleBetween(popUp,topVec));
        processing.stroke(0);
        processing.strokeWeight(1);
        processing.rect(0, 1, 10, maggg-20);
        processing.popMatrix();

          sceneAngX = processing.map(processing.mouseX, 0, processing.width, Math.PI/3, -Math.PI/3);
          sceneAngY = processing.map (processing.mouseY, 0, processing.height, Math.PI/8, 0);

      

  };


  //particle

  function Particle(){

      this.location = new processing.PVector(processing.width/2,processing.height/2,processing.random(80,100));
      this.speed = new processing.PVector(processing.random(-3,3),processing.random(-3,3),processing.random(-2,0.2));
      this.acc = new processing.PVector(0,0,0);
      this.alpha = processing.random(100,200);
      this.rad = processing.random(8,20);
      this.col = processing.random(0,1);

      this.speed.mult(5);
      this.originspeed = processing.PVector.get(this.speed);

  }

  Particle.prototype.move = function(){
    if(processing.dist(processing.width/2,processing.height/2,this.location.x,this.location.y)>200) {this.speed.mult(0.99);}
     this.location.add(this.speed);

     if(this.location.x >processing.width || this.location.x <0 || this.location.y>processing.height || this.location.y <0 || this.speed.mag() <0.01){
  
      this.location.x = processing.width/2;
      this.location.y = processing.height/2;
      this.location.z = 0;
      this.speed = processing.PVector.get(this.originspeed);
    }
  }

  Particle.prototype.display = function(){

        processing.pushMatrix();
        processing.translate(this.location.x,this.location.y,this.location.z);
        processing.rotateX(Math.PI);
        processing.noStroke();
        if(this.col>0.5)   processing.fill(255,200,200,this.alpha);
        else processing.fill(200,200,255,this.alpha);
        processing.ellipse(0,0,this.rad,this.rad);
        processing.popMatrix();

  }


    processing.mouseDragged = function() {

        var newMouseY = processing.mouseY;
       if(oldMouseY < newMouseY) cardAng -=0.15;
       else if(oldMouseY>newMouseY) cardAng +=0.15;
       oldMouseY = newMouseY; 

  };

}

var canvas = document.getElementById("canvas");

var p = new Processing(canvas,sketch);
