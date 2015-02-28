
class Blob {

  
  
  ArrayList<Particle> allParticles;
  ArrayList<Particle> allFace;
  ArrayList allSprings;
  
  Particle body, head, n_eye1, n_eye2, n_mouth; //nucleo, head, eyes
  float large;
  

//define constructor
Blob(  float x, float y, float sizeBlob){
  

//setup
int particles_number= 30;
float angle=radians(random(360));
float u = radians(360/particles_number);
float v;
large = sizeBlob; //dimension connections
float _x = x;
float _y = y;

  allParticles = new ArrayList<Particle>();
  allFace = new ArrayList<Particle>();
  allSprings = new ArrayList();
  

  
 
 
   ////////////// BODY
  
  body = new Particle(_x,_y);
  
  body.r = large*1.3; // ratio big circle
  physics.addBehavior(new AttractionBehavior(body, large*0.7, -1));
  
  head = new Particle(_x,_y);
 
  physics.addParticle(body);


   
  head.r = large*1.1;
  
  n_eye1 = new Particle(head.x,head.y);
  n_eye1.r = large*0.06; 
  
  n_eye2 = new Particle(head.x,head.y);
  n_eye2.r = large*0.06; 
  
  n_mouth = new Particle(head.x,head.y);
  n_mouth.r = 0;


  
  VerletSpring2D spring_body = new VerletSpring2D(body, head, large*0.4, 0.1); //join the body and face
  VerletSpring2D spring_eye1 = new VerletSpring2D(body, n_eye1, large*0.5, 0.1); 
  VerletSpring2D spring_eye2 = new VerletSpring2D(body, n_eye2, large*0.5, 0.1);
  
  VerletSpring2D spring_eye1_1 = new VerletSpring2D(head, n_eye1, large*0.1, 0.1);
  VerletSpring2D spring_eye2_2 = new VerletSpring2D(head, n_eye2, large*0.1, 0.1);
  
  VerletSpring2D spring_eyes = new VerletSpring2D(n_eye2, n_eye1, large*0.15, 0.1);
  VerletSpring2D spring_mouth = new VerletSpring2D(body, n_mouth, large*0.3, 0.1);
  VerletSpring2D spring_mouth2 = new VerletSpring2D(n_eye1, n_mouth, large*0.18, 0.1);
  VerletSpring2D spring_mouth3 = new VerletSpring2D(n_eye2, n_mouth, large*0.18, 0.1);


  physics.addSpring(spring_body);
  physics.addSpring(spring_eye1);
  physics.addSpring(spring_eye2);
  physics.addSpring(spring_eye1_1);
  physics.addSpring(spring_eye2_2);
  physics.addSpring(spring_eyes);
  physics.addSpring(spring_mouth);
  physics.addSpring(spring_mouth2);
  physics.addSpring(spring_mouth3);
  
    ////////////// END BODY


  //////////////////////////physics.addParticle(body);
  for (int i= 0; i< particles_number; i++) { 
    
    v = large + 3 * sin(u*i*(particles_number/2.5));
    Particle p = new Particle(x + v * cos(angle + i*u), y + v * sin(angle + i*u)); //arrange different ratios in a sinusoidal way
    p.r = random(large*0.05,large*0.2);
    physics.addParticle(p);
    allParticles.add(p);
    physics.addBehavior(new AttractionBehavior(p, 10, -1));

    
    // add a spring between body and every p
    
    VerletSpring2D spring = new VerletSpring2D(body, allParticles.get(i), v-large*0.25, 0.01);
    physics.addSpring(spring);
    allSprings.add(spring);
    

    
    
    
  }
  //////////////////////////end physics.addParticle(body);
  

  //////////////////////////physics.addParticle(head);
  
  for (int i= 0; i< 30; i++) { 
    
    v = large*0.65 + 10 * sin(u*i*(30/5.5));
    Particle p = new Particle(x + v * cos(angle + i*u), y + v * sin(angle + i*u)); //arrange different ratios in a sinusoidal way
    p.r = random(large*0.02,large*0.1);
    physics.addParticle(p);
    allFace.add(p);
    p.r=random(1,4);
    physics.addBehavior(new AttractionBehavior(p, 10, -1));

    // add a spring between n2 and every p
    
    VerletSpring2D spring_face = new VerletSpring2D(head, allFace.get(i), v, 0.01);
    physics.addSpring(spring_face);
    allSprings.add(spring_face);
        
    
    
  }
  
 //////////////////////////end physics.addParticle(head);
  
  }
  
  //end define constructor
  
  void display(color c){
    
    physics.update();
    
    for (Particle p : allParticles) {
    p.displayParticles(); 
    stroke(c);
    strokeWeight(3);
    line(body.x, body.y, p.x, p.y);
    
    }
    
    for (Particle p : allFace) {
    p.displayParticles(); 
    stroke(c);
    strokeWeight(0.5);
    line(head.x, head.y, p.x, p.y);
    
   
  }
    
  
  body.displayParticles();
  head.displayParticles();
  n_eye1.displayFace(floor(large));
  n_eye2.displayFace(floor(large));
  
  Vec2D f = new Vec2D(0,(large*0.05*(mouseY-height*0.5)/10));
  body.addForce(f);
  
  float boca = abs(mouseY-height*0.5);
  float bocaMap = map(boca, 0,200,0,large*0.2);
  println(bocaMap);
  
  
 
  if (body.y > height-large*0.5){
//    body.y = height;
//    body.lock();
    n_mouth.displayMouth(4);
  }
  
  else if (body.y < large*0.5){
//    body.y = 0;
//    body.lock();
    n_mouth.displayMouth(4);
  }
  
  
  else{
     n_mouth.displayMouth(bocaMap);
     if(bocaMap>3){
        sound.play();
      }else{
        sound.rewind();

  }
  }
  
  
  
  
  
  }
}

