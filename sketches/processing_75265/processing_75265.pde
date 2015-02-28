
import net.nexttext.*;

import net.nexttext.behaviour.*;

import net.nexttext.behaviour.control.*;

import net.nexttext.behaviour.standard.*;

import net.nexttext.behaviour.dform.*;

import net.nexttext.renderer.*;



/**

 * A NextText-based processing notation sketch, em que clicando e pressionando com o butão esquerdo do mouse
  modificando as letras, efeito de desfiguração tipográfica. Clicando e pressionando com o butão direito do mouse as letras voltam ao estado inicial. 
  E finalmente clicando com o terceiro botão do mouse move-se o texto no screen.




 * by Elie Zananiri | Obx Labs | February 2008 and modified by full tragedy productions, leonardo de melo 2012 on creative commons.

 * Words by <a href="http://www.mitchhedberg.net/">Mitch Hedberg</a></p>

 */



// attributes

Book book;

PFont gangOfThree;



void setup() {

  // init the applet

  size(640, 360);

  smooth();

  

  // create the book

  book = new Book(this);

  

  // pull the text with the first mouse button

  Pull pull = new Pull(Book.mouse, 10, 2);

  OnMouseDepressed onMouseDepressedPull = new OnMouseDepressed(LEFT, pull);

  Behaviour pullOnLeft = onMouseDepressedPull.makeBehaviour();

  

  // move the text with the middle mouse button

  Follow follow = new Follow(Book.mouse);

  OnDrag onDrag = new OnDrag(CENTER, follow);

  Behaviour dragOnCenter = onDrag.makeBehaviour();

  

  // reform the text with the right mouse button

  Reform reform = new Reform();

  OnMouseDepressed onMouseDepressedReform = new OnMouseDepressed(RIGHT, reform);

  Behaviour reformOnRight = onMouseDepressedReform.makeBehaviour();



  // add the behaviours to the book

  book.addGroupBehaviour(pullOnLeft);

  book.addGroupBehaviour(dragOnCenter);

  book.addGroupBehaviour(reformOnRight);



  // init and set the font

  gangOfThree = createFont("GangOfThree.ttf", 28, true);

  textFont(gangOfThree);

  textAlign(CENTER);

  

  // set the text colour

  fill(#656F28);

  stroke(0);

  strokeWeight(2);

  

  // add the text

  book.addText("full tragedy productions 2012", width/2, height/2);
                  


  // set the background colour

  noStroke();

  fill(212, 222, 152, 50);

}



void draw() {

  // draw a semi-transparent background to give all elements ghost trails

  rect(0, 0, width, height);



  // apply the behaviours to the text and draw it

  book.stepAndDraw();

}

