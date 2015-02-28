
/*
[ Self - Pong ]
by Gildas P. / http://www.gildasp.fr/playingwithpixels/
*/

class ColliderRect {
  
  int posx, posy, larg, haut;
  
  ColliderRect(int _x, int _y, int _l, int _h){
    posx = _x;
    posy = _y;
    larg = _l;
    haut = _h;
  } 
  
  void updateCollider(){  }
  
  void drawCollider(){
      stroke(255, 0, 255);
      noFill();
      rect(posx, posy, larg, haut);
      noStroke();
  }
  
  // moteur de collisions rectangles
  
  Boolean collideRect (ColliderRect obj2){ // centré !
    if(abs(posx-obj2.posx)<(larg/2+obj2.larg/2) && abs(posy-obj2.posy)<(haut/2+obj2.haut/2)){
    	// colide !
    	return true;
    } else { 
      return false; 
    }
  }	
  ArrayList collideRectList (ArrayList objArray){
    Boolean collision = false;
    ArrayList colliders = new ArrayList();
    for(int k=0; k<objArray.size(); k++){
        ColliderRect obj = (ColliderRect) objArray.get(k);
    	if(objArray.get(k) != this && collideRect(obj)){
    	  collision = true;
    	  colliders.add(obj);
    	}
    } // retourne false ou la liste des collisionnés...
    //if(collision){
      return colliders;
    /*} else {
    	return false;
    }*/
  }
  float[] collideRectVector (ColliderRect obj2){	
    // retourne les vecteurs x et y à appliquer à this
    // ainsi que la longuer du vecteur (pour obtenir le vecteur unitaire facilement)
    // (l'autre s'occupera de lui-même)
    float vectx = (posx-obj2.posx)/2;
    float vecty = (posy-obj2.posy)/2;
    float distance = dist(posx, posy, obj2.posx, obj2.posy);
    
    float[] vecteur = { vectx, vecty, distance };
    return vecteur;
  }
  /*float[] collideRectUnitVector (ColliderRect obj2){
    float[] tmp = collideRectVector (obj2);
    float distance = dist(posx, posy, obj2.posx, obj2.posy);
    float vectx = tmp[0]/distance;
    float vecty = tmp[1]/distance;
    float[] vecteur = { vectx, vecty, distance };
    return vecteur;
  }*/
}

