
import game2dai.entities.*;
import game2dai.entityshapes.ps.*;
import game2dai.maths.*;
import game2dai.*;
import game2dai.entityshapes.*;
import game2dai.fsm.*;
import game2dai.steering.*;
import game2dai.utils.*;
import game2dai.graph.*;

World world;
Pitch pitch;
PFont font;
// Offset of pitch within window
int offsetX = 20, offsetY = 60;
// State info colours
int controlCol, threatCol, receiverCol, supportCol;
float controlDiam = 25, typeDiam = 29, threatDiam = 33;

boolean showTypes, showStates;

StopWatch sw = new StopWatch();

public void setup() {
  size(640, 450);
  controlCol = color(0, 0, 255);
  threatCol = color(255, 0, 0);
  receiverCol = color(0, 255, 0);
  supportCol = color(255, 255, 0);

  font = createFont("Sans Serif", 14);
  world = new World(600, 300, 100, 100);  
  world.noOverlap(true);
  pitch = new Pitch(this, world, 600, 300);  
  pitch.FSM().setCurrentState(PitchPlayersOff.state());
  world.addArtefact(pitch);
  pitch.Z(-10);
  sw.reset();
}

public void keyReleased() {
  if (key == '1')
    showStates = !showStates;
  if (key == '2')
    showTypes = !showTypes;
  if (key == '3')
    pitch.showSpots = !pitch.showSpots;
  if (key == 'n' || key == 'N') {
    pitch.sw.reset();
    pitch.FSM().changeState(PitchPlayersOff.state());
  }
}

public void drawStateInfo() {
  int side = 0;
  float tw;
  String teamState;

  fill(0);
  teamState = pitch.FSM().getCurrentState().name;
  tw = textWidth(teamState);
  text(teamState, (pitch.length - tw)/2, - 8);
  for (Team t : pitch.teams) {
    teamState = t.FSM().getCurrentState().name;
    tw = (t.pitchSide == 0) ? 110 : pitch.length - 110 - textWidth(teamState);
    text(teamState, tw, - 8);
    for (PlayerBase p : t.players) {
      Vector2D pos = p.pos();
      if (pos.y <= pitch.width) {
        teamState = p.name() + " " + p.FSM().getCurrentState().name;
        text(teamState, (float)pos.x, (float)pos.y - 10);
      }
    }
    side++;
  }
}

public void drawTeamInfo() {
  noFill();
  strokeWeight(2);
  ellipseMode(CENTER);
  Team[] teams = pitch.teams;
  PlayerBase player;
  strokeWeight(2);
  for (Team t : teams) {
    player = t.getControllingPlayer();
    if (player != null) {
      stroke(controlCol);
      ellipse((float)player.pos().x, (float) player.pos().y, controlDiam, controlDiam);
      if (player.isThreatened()) {
        stroke(threatCol);
        ellipse((float)player.pos().x, (float) player.pos().y, threatDiam, threatDiam);
      }
    }
    player = t.getSupportingPlayer();
    if (player != null) {
      stroke(supportCol);
      ellipse((float)player.pos().x, (float) player.pos().y, typeDiam, typeDiam);
    }
    player = t.getReceivingPlayer();
    if (player != null) {
      stroke(receiverCol);
      ellipse((float)player.pos().x, (float) player.pos().y, typeDiam, typeDiam);
    }
  }
}

public void drawLegend() {
  noStroke();
  fill(30, 128, 30);
  rect(0, pitch.width + 8, pitch.length, 72);
  fill(0);
  textFont(font);
  text("[1] toggle state names", 10, pitch.width + 24);
  text("[2] toggle player highlights", 10, pitch.width + 40);
  text("[3] toggle supporting spots", 10, pitch.width + 56);
  text("[N] start new match", 10, pitch.width + 72);

  text("Player Highlights", 410, pitch.width + 24);
  text("Controlling", 340, pitch.width + 40);
  text("When threatened", 340, pitch.width + 56);
  text("Supporting", 500, pitch.width + 40);
  text("Receivng", 500, pitch.width + 56);
  strokeWeight(2);
  noFill();
  int r = 8;
  stroke(controlCol);
  ellipse(330, pitch.width + 40 - r/2, r, r);
  stroke(threatCol);
  ellipse(330, pitch.width + 56 - r/2, r, r);
  stroke(supportCol);
  ellipse(490, pitch.width + 40 - r/2, r, r);
  stroke(receiverCol);
  ellipse(490, pitch.width + 56 - r/2, r, r);
}

public void draw() {
  world.update(sw.getElapsedTime());
  background(60, 160, 60);
  translate(offsetX, offsetY);
  pushMatrix();

  world.draw();

  textFont(font);
  if (showStates)
    drawStateInfo();
  if (showTypes)
    drawTeamInfo();
  drawLegend();
  popMatrix();
}

