
/**
* modify it under the terms of the GNU Lesser General Public  

 * License as published by the Free Software Foundation; either  

 * version 2.1 of the License, or (at your option) any later version.  

 *   

 * http://creativecommons.org/licenses/LGPL/2.1/  

 *   

 * This library is distributed in the hope that it will be useful,  

 * but WITHOUT ANY WARRANTY; without even the implied warranty of  

 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU  

 * Lesser General Public License for more details.  

 *   

 * You should have received a copy of the GNU Lesser General Public  

 * License along with this library; if not, write to the Free Software  

 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA  

 */ 

    

import toxi.physics2d.constraints.*;  

import toxi.physics2d.behaviors.*;  

import toxi.physics2d.*;  

   

import toxi.geom.*;  

   

// squared snap distance for mouse selection  

float SNAP_DIST = 20 * 20;  

   

// define a HashMap to provide a table centric view of the participants data  

// http://mindprod.com/jgloss/hashmap.html  

// http://download.oracle.com/javase/6/docs/api/java/util/HashMap.html  

HashMap<Integer, ArrayList<String>> tables=new HashMap<Integer, ArrayList<String>>();  

   

VerletPhysics2D physics;  

VerletParticle2D selectedParticle;  

   

void setup() {  

  size(640,480);  

  parseData("Price2.csv");  

  initPhysics();  

  textFont(createFont("SansSerif",10));  

}  

   

void draw() {  

  // 1st update  

  physics.update();  

  // then drawing  

  background(224);  

  // draw springs  

  stroke(255,0,255);  

  for(VerletSpring2D s : physics.springs) {  

    line(s.a.x, s.a.y, s.b.x, s.b.y);  

  }  

  // then all particles  

  noStroke();  

  for(VerletParticle2D p : physics.particles) {  

    fill(0);  

    ellipse(p.x, p.y, 5, 5);  

    // also draw label if needed  

    if (p instanceof LabeledParticle) {  

      // first need to cast particle to be a LabeledParticle  

      // in order to access its label property  

      LabeledParticle lp=(LabeledParticle)p;  

      fill(0, 0, 128);  

      text(lp.label, p.x, p.y-4);  

    }  

  }  

  // highlight selected particle (if there is one currently)  

  if (selectedParticle!=null) {  

    fill(255, 0, 255);  

    ellipse(selectedParticle.x, selectedParticle.y, 20, 20);  

  }  

}  

   

void mousePressed() {  

  // find particle under mouse  

  Vec2D mousePos=new Vec2D(mouseX,mouseY);  

  for(int i=1; i<physics.particles.size(); i++) {  

    VerletParticle2D p=physics.particles.get(i);  

    if (mousePos.distanceToSquared(p)<SNAP_DIST) {  

      selectedParticle=p.lock();  

      break;  

    }  

  }  

}  

   

void mouseDragged() {  

  if (selectedParticle!=null) {  

    // move selected particle to new mouse pos  

    selectedParticle.set(mouseX,mouseY);  

  }  

}  

   

void mouseReleased() {  

  // unlock the selected particle  

  if (selectedParticle!=null) {  

    selectedParticle.unlock();  

    selectedParticle=null;  

  }  

}  

   

void keyPressed() {  

  if (key=='r') {  

    initPhysics();  

  }  

}  

   

// load a simple 2-column CSV file in this format:  

// name,table number  

void parseData(String path) {  

  String[] lines=loadStrings(path);  

  // iterate over all lines loaded  

  for(String l : lines) {  

    // skip empty lines  

    if (l.length()>0) {  

      // split line into 2 values  

      String[] items=split(l,",");  

      // get table ID  

      int id=int(items[1]);  

      // check if table is already known  

      // get() will return a null if still unknown  

      ArrayList<String> names=tables.get(id);  

      if (names==null) {  

        // if ID still unknown, create a new (empty) list for names  

        names=new ArrayList<String>();  

        // associated the list with the table ID  

        tables.put(id,names);  

      }  

      // add the name to the list  

      names.add(items[0]);  

    }  

  }  

}  

   

void initPhysics() {  

  physics=new VerletPhysics2D();  

  // we increase the drag (loss of energy) to 5% to avoid to much chaos  

  // during the force directed layout process  

  // disabling or choosing lower values will result in a  

  // longer period until the system has settled  

  physics.setDrag(0.05);  

  // set screen bounds as bounds for physics sim  

  physics.setWorldBounds(new Rect(0,0,width,height));  

  // create a fixed root particle to connect all clusters to  

  VerletParticle2D root=new VerletParticle2D(width/2,height/2).lock();  

  physics.addParticle(root);  

  // add a repulsive force around the root particle to force all  

  // name particles to align themselves away from the centre  

  physics.addBehavior(new AttractionBehavior(root,250,-1));  

     

  // next we translate the table hashmap into a particle structure as follows:  

  // all particles are created as LabeledParticle (see further below)  

  // each table cluster gets one central particle  

  // names for each table are created as further particles clustering around the table centre  

  // furthermore, the table centres have a repulsive field to keep other clusters/tables away  

  // the name particles too have a weaker repulsion attached to better space them out  

   

  // the keySet() method of a HashMap returns the collection of known keys  

  // in our case these keys are integers (the table IDs)...  

  for(int tableID : tables.keySet()) {  

    // create a particle for the cluster centre  

    VerletParticle2D p=new LabeledParticle(random(width),random(height),"table #"+tableID);  

    physics.addParticle(p);  

    // add repulsive force to space out clusters  

    physics.addBehavior(new AttractionBehavior(p,100,-1));  

    // connect to locked root particle  

    physics.addSpring(new VerletSpring2D(p,root,100,1));  

    // now process all names associated with the current table ID  

    // since values in our HashMap are of type ArrayList<String>  

    // tables.get(tableID) will return a list of Strings  

    for(String name : tables.get(tableID)) {  

      // create particle for each name  

      VerletParticle2D n=new LabeledParticle(random(width),random(height),name);  

      physics.addParticle(n);  

      // create weak repulsion for spacing  

      physics.addBehavior(new AttractionBehavior(n,50,-0.5));  

      // connect to cluster centre (table particle)  

      physics.addSpring(new VerletSpring2D(n,p,60,0.01));  

    }  

  }  

}  

   

// the sole purpose of this tiny class is to store a label String with each particle  

// everything else is inherited from the usual VerletParticle2D class  

   

class LabeledParticle extends VerletParticle2D {  

     

  String label;  

     

  LabeledParticle(float x, float y, String label) {  

    super(x,y);  

    this.label=label;  

  }  

} 


