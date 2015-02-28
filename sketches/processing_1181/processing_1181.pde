
/**
<p>200 wandering souls organize 401 woodchips without any centralized planning. Click to reset, hit any key to watch the paths of woodchips over time.</p>
<p>Each wanderer follows two rules:</p>
<ul>
 <li>If you run into a woodchip and don't have one, pick it up.</li>
 <li>If you run into a woodchip and do have one, drop it off.</li>
</ul>
<p>Each circle represents a pile, as it gains woodchips its size increases. The wanderers turn red when they are carrying a woodchip.</p>
<p><a href="chips.mp3">Listen</a> to Chips. Each chip is a note, played while it is being moved between piles, with pitch corresponding to the pile it was removed from and dynamics to the size of that pile. From muddled chaos emerges a chord.</p>
<p><i>(Thanks to <a href="http://www.rpi.edu/~heuveb/">Bram</a> for helping me see why it converges to a single pile).</i></p>
*/

Wanderer[] wanderers = new Wanderer[200];
Group[] groups = new Group[401];

boolean t = false;
PFont font; 

void setup() {
  font = loadFont("Helonia-14.vlw");
  
  for(int i = 0; i < wanderers.length; i++)
    wanderers[i] = new Wanderer();
  for(int i = 0; i < groups.length; i++)
    groups[i] = new Group();
  size(400,400);
  background(255);
}

void draw() {
  if(!t) background(255);
  for(int i = 0; i < wanderers.length; i++) {
    wanderers[i].update();
    wanderers[i].display();
  }
  for(int i = 0; i < groups.length; i++)
    groups[i].display();
}

void mousePressed() {
  setup();
}

void keyPressed() {
  t = t?false:true;
  background(255);
}

