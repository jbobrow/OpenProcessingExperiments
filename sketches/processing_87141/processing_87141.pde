
//X=eyes rolling
//Y=jaw closing

void setup(){
  size(400,500);
}

void draw(){
  background(255);
  translate(width/2,height);
  
  //right horn
  bezier(101,-389,126,-408,146,-442,132,-496);
  bezier(134,-332,192,-389,164,-442,132,-496);
  
  //left horn
  bezier(-101,-389,-126,-408,-146,-442,-132,-496);
  bezier(-134,-332,-192,-389,-164,-442,-132,-496);
  
  //top jaw
  stroke(0);
  fill(255);
  beginShape();
    vertex(47,-109);
    bezierVertex(51,-106,54,-100,52,-94);
    bezierVertex(47,-89,43,-88,37,-89);
    bezierVertex(32,-92,30,-98,31,-104);
    endShape();
  beginShape();
    vertex(27,-103);
    bezierVertex(28,-99,30,-92,28,-87);
    bezierVertex(20,-82,10,-81,4,-85);
    bezierVertex(2,-90,0,-95,3,-100);
    endShape();
  beginShape();
    vertex(-47,-109);
    bezierVertex(-51,-106,-54,-100,-52,-94);
    bezierVertex(-47,-89,-43,-88,-37,-89);
    bezierVertex(-32,-92,-30,-98,-31,-104);
    endShape();
  beginShape();
    vertex(-27,-103);
    bezierVertex(-28,-99,-30,-92,-28,-87);
    bezierVertex(-20,-82,-10,-81,-4,-85);
    bezierVertex(-2,-90,0,-95,-3,-100);
    endShape();
  bezier(51,-108,16,-96,-16,-96,-51,-108);
  
  float Y = 60 - mouseX/6.4;    
    
  //bottom teeth
  stroke(0);
  noFill();
  bezier(57,-45-Y,62,-49-Y,64,-58-Y,60,-63-Y);
  bezier(60,-63-Y,54,-69-Y,43,-69-Y,37,-63-Y);
  bezier(37,-63-Y,33,-59-Y,34,-55-Y,37,-49-Y);
  bezier(25,-51-Y,29,-55-Y,32,-62-Y,27,-66-Y);
  bezier(27,-66-Y,21,-69-Y,13,-70-Y,4,-65-Y);
  bezier(4,-65-Y,1,-62-Y,2,-56-Y,6,-51-Y);
  bezier(-57,-45-Y,-62,-49-Y,-64,-58-Y,-60,-63-Y);
  bezier(-60,-63-Y,-54,-69-Y,-43,-69-Y,-37,-63-Y);
  bezier(-37,-63-Y,-33,-59-Y,-34,-55-Y,-37,-49-Y);
  bezier(-25,-51-Y,-29,-55-Y,-32,-62-Y,-27,-66-Y);
  bezier(-27,-66-Y,-21,-69-Y,-13,-70-Y,-4,-65-Y);
  bezier(-4,-65-Y,-1,-62-Y,-2,-56-Y,-6,-51-Y);
  
  //top teeth
  stroke(0);
  fill(255);
  beginShape();
    vertex(47,-109);
    bezierVertex(51,-106,54,-100,52,-94);
    bezierVertex(47,-89,43,-88,37,-89);
    bezierVertex(32,-92,30,-98,31,-104);
    endShape();
  beginShape();
    vertex(27,-103);
    bezierVertex(28,-99,30,-92,28,-87);
    bezierVertex(20,-82,10,-81,4,-85);
    bezierVertex(2,-90,0,-95,3,-100);
    endShape();
  beginShape();
    vertex(-47,-109);
    bezierVertex(-51,-106,-54,-100,-52,-94);
    bezierVertex(-47,-89,-43,-88,-37,-89);
    bezierVertex(-32,-92,-30,-98,-31,-104);
    endShape();
  beginShape();
    vertex(-27,-103);
    bezierVertex(-28,-99,-30,-92,-28,-87);
    bezierVertex(-20,-82,-10,-81,-4,-85);
    bezierVertex(-2,-90,0,-95,-3,-100);
    endShape();
  bezier(51,-108,16,-96,-16,-96,-51,-108);
  
  //bottom jaw
  noStroke();
  fill(255);
  beginShape();
    vertex(54,-45-Y);
    bezierVertex(25,-53-Y,-25,-53-Y,-54,-45-Y);
    vertex(-54,0-Y);
    vertex(54,0-Y);
    vertex(54,-45-Y);
    endShape();
  stroke(0);
  noFill();
  bezier(125,-143-Y,88,-95-Y,157,37-Y,0,-25-Y);
  bezier(110,-140-Y,91,-101-Y,161,11-Y,46,-40-Y);
  bezier(106,-139-Y,85,-116-Y,145,-27-Y,46,-47-Y);
  fill(255);
  noStroke();
  beginShape();
    vertex(107,-140-Y);
    bezierVertex(93,-101-Y,160,13-Y,46,-41-Y);
    vertex(43,-42-Y);
    bezierVertex(145,-27-Y,89,-112-Y,110,-139-Y);
    endShape();  
  stroke(0);
  noFill();
  bezier(-125,-143-Y,-88,-95-Y,-157,37-Y,0,-25-Y);
  bezier(-110,-140-Y,-91,-101-Y,-161,11-Y,-46,-40-Y);
  bezier(-106,-139-Y,-85,-116-Y,-145,-27-Y,-46,-47-Y);
  fill(255);
  noStroke();
  beginShape();
    vertex(-105,-140-Y);
    bezierVertex(-93,-101-Y,-158,12-Y,-46,-41-Y);
    vertex(-43,-42-Y);
    bezierVertex(-145,-27-Y,-89,-112-Y,-110,-139-Y);
    endShape();
  
  //face covering the jaw
  noStroke();
  fill(255);
  beginShape();
    vertex(-51,-108);
    bezierVertex(-16,-96,16,-96,51,-108);
    vertex(49,-115);
    bezierVertex(68,-118,84,-126,98,-139);
    bezierVertex(99,-139,119,-141,130,-146);
    vertex(130,-292);
    vertex(-130,-292);
    vertex(-130,-146);
    bezierVertex(-119,-141,-99,-139,-98,-139);
    bezierVertex(-84,-126,-68,-118,-49,-115);
    vertex(-51,-108);
    endShape();
  
  //bottom lip covering top teeth
  noFill();
  stroke(0);  
  bezier(46,-47-Y,34,-50-Y,23,-51-Y,0,-51-Y);
  bezier(-46,-47-Y,-34,-50-Y,-23,-51-Y,0,-51-Y);
    
  //top outside fang  
  stroke(0);
  fill(255);
  beginShape();
    vertex(97,-137);
    bezierVertex(107,-109,116,-99,141,-72);
    bezierVertex(117,-83,88,-103,84,-127);
    bezierVertex(88,-130,93,-133,97,-137);
    endShape();
  beginShape();
    vertex(-97,-137);
    bezierVertex(-107,-109,-116,-99,-141,-72);
    bezierVertex(-117,-83,-88,-103,-84,-127);
    bezierVertex(-88,-130,-93,-133,-97,-137);
    endShape();
   
  //right eye
  stroke(0);
  noFill();
  ellipse(68,-240,70,70);
  float X = pow(mouseX/20, 1.2);
  fill(255,0,0);
  ellipse(68-mouseX/10,-240-X,30,30);
  fill(255,255,0);
  noStroke();
  ellipse(68-mouseX/10,-240-X*1.25,12,12);
  fill(0);
  ellipse(68-mouseX/10,-240-X*1.3,10,10);
  fill(255);
  noStroke();
  beginShape();
    vertex(15,-241);
    bezierVertex(59,-252,55,-269,78,-270);
    bezierVertex(95,-268,107,-230,129,-267);
    bezierVertex(57,-333,-25,-427,15,-241);
    endShape();
  beginShape();
    vertex(26,-202);
    bezierVertex(54,-227,84,-207,114,-221);
    bezierVertex(85,-180,80,-190,26,-202);
    endShape();
  //left eye
  stroke(0);
  noFill();
  ellipse(-68,-240,70,70);
  //duplicate variable X
  fill(255,0,0);
  ellipse(-68+mouseX/10,-240-X,30,30);
  fill(255,255,0);
  noStroke();
  ellipse(-68+mouseX/10,-240-X*1.25,12,12);
  fill(0);
  ellipse(-68+mouseX/10,-240-X*1.3,10,10);
  fill(255);
  noStroke();
  beginShape();
    vertex(-15,-241);
    bezierVertex(-59,-252,-55,-269,-78,-270);
    bezierVertex(-95,-268,-107,-230,-129,-267);
    bezierVertex(-57,-333,25,-427,-15,-241);
    endShape();
  beginShape();
    vertex(-26,-202);
    bezierVertex(-54,-227,-84,-207,-114,-221);
    bezierVertex(-85,-180,-80,-190,-26,-202);
    endShape();
  //third eye  
  noFill();
  stroke(0);
  ellipse(0,-361,70,70);
  fill(255,0,0);
  ellipse(0,-361,30,30);
  fill(255,255,0);
  noStroke();
  ellipse(0,-361,12,12);
  fill(0);
  ellipse(0,-361,10,10);
  noStroke();
  fill(255);
  beginShape();
    vertex(mouseX/80,-398);
    bezierVertex(mouseX/15,-374,mouseX/15,-349,mouseX/60,-330);
    bezierVertex(0,-230,150,-450,mouseX/80,-398);
    endShape();
    noStroke();
  fill(255);
  beginShape();
    vertex(-mouseX/80,-398);
    bezierVertex(-mouseX/15,-374,-mouseX/15,-349,-mouseX/60,-330);
    bezierVertex(0,-230,-150,-450,-mouseX/80,-398);
    endShape();
    
  noFill();
  stroke(0);
  //starting on right half of face and moving down
  bezier(0,-426,17,-426,30,-431,51,-409);
  bezier(51,-409,77,-412,95,-406,101,-389);
  bezier(101,-389,99,-359,111,-340,134,-332);
  bezier(134,-332,136,-305,148,-278,150,-253);
  bezier(150,-253,151,-241,150,-228,145,-215);
  bezier(145,-215,169,-189,172,-138,76,-137);
  bezier(97,-137,72,-115,38,-110,2,-112);
  bezier(2,-112,0,-112,0,-112,0,-117);
  //starting right ear
  bezier(140,-299,151,-318,175,-322,196,-330);
  bezier(196,-330,184,-300,165,-276,176,-241);
  bezier(176,-241,181,-218,178,-201,154,-203);
  bezier(177,-212,183,-195,190,-175,159,-172);
  //starting on left half of face and moving down
  bezier(0,-426,-17,-426,-30,-431,-51,-409);
  bezier(-51,-409,-77,-412,-95,-406,-101,-389);
  bezier(-101,-389,-99,-359,-111,-340,-134,-332);
  bezier(-134,-332,-136,-305,-148,-278,-150,-253);
  bezier(-150,-253,-151,-241,-150,-228,-145,-215);
  bezier(-145,-215,-169,-189,-172,-138,-76,-137);
  bezier(-97,-137,-72,-115,-38,-110,-2,-112);
  bezier(-2,-112,0,-112,0,-112,0,-117);
  //starting left ear
  bezier(-140,-299,-151,-318,-175,-322,-196,-330);
  bezier(-196,-330,-184,-300,-165,-276,-176,-241);
  bezier(-176,-241,-181,-218,-178,-201,-154,-203);
  bezier(-177,-212,-183,-195,-190,-175,-159,-172);
  //starting right half of facial features
  bezier(12,-287,2,-280,30,-224,0,-224);
  bezier(12,-228,21,-225,20,-202,5,-209);
  bezier(8,-199,22,-209,59,-195,25,-166);
  bezier(4,-180,15,-182,12,-188,24,-184);
  bezier(24,-184,29,-182,20,-172,9,-173);
  bezier(4,-180,11,-172,19,-155,0,-155);
  bezier(11,-159,6,-150,0,-144,0,-117);
  
  //bottom fang
  fill(255);
  beginShape();
    vertex(91,-48-Y);
    bezierVertex(98,-60-Y,94,-80-Y,100,-96-Y);
    bezierVertex(86,-87-Y,91,-62-Y,62,-45-Y);
    bezierVertex(70,-43-Y,88,-44-Y,91,-48-Y);
    endShape();
  beginShape();
    vertex(-91,-48-Y);
    bezierVertex(-98,-60-Y,-94,-80-Y,-100,-96-Y);
    bezierVertex(-86,-87-Y,-91,-62-Y,-62,-45-Y);
    bezierVertex(-70,-43-Y,-88,-44-Y,-91,-48-Y);
    endShape();
    
  //top inside fang
  beginShape();
    vertex(67,-119);
    bezierVertex(66,-106,72,-92,85,-76);
    bezierVertex(68,-82,50,-94,49,-114);
    bezierVertex(55,-115,61,-117,67,-119);
    endShape();
  beginShape();
    vertex(-67,-119);
    bezierVertex(-66,-106,-72,-92,-85,-76);
    bezierVertex(-68,-82,-50,-94,-49,-114);
    bezierVertex(-55,-115,-61,-117,-67,-119);
    endShape();
  
  //top eyelid
  noFill();
  bezier(15,-241,66,-254,74,-284,91,-323);
  bezier(53,-259,97,-290,97,-225,129,-267);
  //bottom eyelid
  bezier(26,-202,54,-227,84,-207,114,-221);
  //starting left half of facial features
  bezier(-12,-287,-2,-280,-30,-224,0,-224);
  bezier(-12,-228,-21,-225,-20,-202,-5,-209);
  bezier(-8,-199,-22,-209,-59,-195,-25,-166);
  bezier(-4,-180,-15,-182,-12,-188,-24,-184);
  bezier(-24,-184,-29,-182,-20,-172,-9,-173);
  bezier(-4,-180,-11,-172,-19,-155,0,-155);
  bezier(-11,-159,-6,-150,0,-144,0,-117);
  //top eyelid
  bezier(-15,-241,-66,-254,-74,-284,-91,-323);
  bezier(-53,-259,-97,-290,-97,-225,-129,-267);
  //bottom eyelid
  bezier(-26,-202,-54,-227,-84,-207,-114,-221);
  //third eye right
  bezier(mouseX/80,-398,mouseX/15,-374,mouseX/15,-349,mouseX/40,-330);
  bezier(mouseX/40,-330,0,-321,0,-315,15,-308);
  bezier(mouseX/40+2,-402,mouseX/10+10,-374-mouseX/120,mouseX/10+10,-349+mouseX/120,mouseX/35+5,-325);
  //third eye left
  bezier(-mouseX/80,-398,-mouseX/15,-374,-mouseX/15,-349,-mouseX/40,-330);
  bezier(-mouseX/40,-330,0,-321,0,-315,-15,-308);
  bezier(-mouseX/40-2,-402,-mouseX/10-10,-374-mouseX/120,-mouseX/10-10,-349+mouseX/120,-mouseX/35-5,-325);
}


