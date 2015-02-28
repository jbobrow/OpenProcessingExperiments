
/*
    Copyright 2009 Michael Ogawa

    This file is part of Wordookie.

    Wordookie is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Wordookie is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Wordookie.  If not, see <http://www.gnu.org/licenses/>.
*/

/*This is Summer Johnston's wordookie example*/

import wordookie.*;

static String FONT = "MingLiU";
static final float MAX_FONT_SIZE = 100f;
static final float MIN_FONT_SIZE = 12f;
static color [] TEXT_COLORS = { #0AC6C5, #0AC634, #04CE56, #482DFA };
color BACKGROUND_COLOR = color( 0 );
static String [] wordInput = { "Parsons",
                               "New School",
                               "Design + Technology",
                               "Parsons",
                               "The New School for Design",
                               "D+T",
                               "Learning Yay!" };

java.util.List wordList;

int wordIndex = 0;
PFont font;
Layout layout;

void setup()
{
  size( 1024, 768 );
  smooth();
  //frameRate( 1 );
  
  font = createFont( FONT, 48 );
  
  // load words
  this.loadWords();
  
  // sort words by weight, decreasing
  this.sortWords();
  
  layout = new Layout( this, BACKGROUND_COLOR );

  background( 0 );
}

void draw()
{  
  if ( wordIndex < wordList.size() )
  {
    Word word = (Word)wordList.get(wordIndex);
    word.font = font;
    
    layout.doLayout( word );
    
    fill( TEXT_COLORS[ (int)random(TEXT_COLORS.length) ] );

    layout.paintWord( word );
    
    wordIndex++;
  }
  else
  {
    println( "Done." );
    noLoop();
  }
}

void loadWords()
{
  wordList = new ArrayList();
  for( int i = 0; i < wordInput.length * 4; i++ )
  {
    Word w = new Word( wordInput[i % wordInput.length], i );
    wordList.add( w );
  }
}

void sortWords()
{
  // sort words by weight
  Collections.sort( wordList );
  
  // assign fonts based on weight, capped at 100
  float greatestWeight = ((Word)wordList.get(0)).weight;
  float leastWeight = ((Word)wordList.get( wordList.size()-1 )).weight;
  for( int i = 0; i < wordList.size(); i++ )
  {
    Word w = (Word)wordList.get(i);
    w.fontSize = (int)map( w.weight, leastWeight, greatestWeight, MIN_FONT_SIZE, MAX_FONT_SIZE );
  }
}

void mouseDragged()
{
  pushStyle();
  fill( 128 );
  noStroke();
  ellipse( mouseX, mouseY, 50, 50 );
  popStyle();
  redraw();
}

/*void keyPressed()
{
  switch( key )
  {
    case 's':
      save( "screen.jpg" );
      break;
    case ' ':
      break;
    case '\n':
      background( BACKGROUND_COLOR );
      wordIndex = 0;
      loop();
      break;
  }
}
*/


