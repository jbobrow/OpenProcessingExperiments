
/*
  Copyright (C) 2007 Andre Seidelt, All Rights Reserved.
 
 This software is provided 'as-is', without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from the
 use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it
 freely, subject to the following restrictions:
 
 1. The origin of this software must not be misrepresented; you must not
 claim that you wrote the original software. If you use this software in
 a product, an acknowledgment in the product documentation would be
 appreciated but is not required.
 
 2. Altered source versions must be plainly marked as such, and must not be
 misrepresented as being the original software.
 
 3. This notice may not be removed or altered from any source distribution.
 */
/*
* a single cell in the big, bad(tm) world.
 */
class Cell {
  // position of the cell
  private int mX, mY;
  // current age of the cell
  private int mAge;
  // the genome of this cell
  private Genome mGenome;
  // unique generation identifier
  private int mGeneration;
  // generation of parent
  private int mParent;
  // string of parent genome
  private String mParentGenome;
  // actual reproduction rate
  private int mReproductionRate;
  // actual food demand rate
  private int mFoodDemand;
  // maximal age
  private int mMaxAge;

  // .ctor(): create at given position
  public Cell(int x, int y) {
    mX = x;
    mY = y;
    mGenome = new Genome();

    mParent = 0;
    mParentGenome = "n/a";
    init();
  }

  // .ctor(): create new cell from parent, possibly mutate
  public Cell(Cell pParent) {
    mX = pParent.mX;
    mY = pParent.mY;
    mGenome = new Genome(pParent.mGenome);

    mParent = pParent.mGeneration;
    mParentGenome = pParent.mGenome.toString();
    init();
  }

  // calculate life values
  private void init() {
    mGeneration = getNextGeneration();
    // big cells need more food
    mFoodDemand = mGenome.mFoodDemand.mValue + 2 * mGenome.mSize.mValue;
    // but big cells live longer
    mMaxAge = mGenome.mAge.mValue + int(mGenome.mAge.mValue * 1.0 / mGenome.mSize.mValue);
    // cells that eat much reproduce faster
    if(mGenome.mReproductionRate.mValue - mFoodDemand/10 > MIN_REP_RATE) {
      mReproductionRate = mGenome.mReproductionRate.mValue - mFoodDemand/10;
    } else {
      mReproductionRate = mGenome.mReproductionRate.mValue;
    }
    sCells.add(this);
  }

  // live a single tick for this cell
  public void live(int pAvailableFood) {
    // if not enought food, then add missing food to age (age faster)
    if(pAvailableFood < mFoodDemand) {
      mAge += mFoodDemand - pAvailableFood;
    }

    // inc age and check if we should die
    mAge++;
    if(mAge > mMaxAge) {
      sCells.remove(this);
      if(sInfo.mCell == this) {
        sInfo.setCurrent(null);
      }
      return;
    }

    // if we reached our reproduction border split child
    if((mAge % mReproductionRate == 0) && (sCells.size() < MAX_CELLS)) {
      new Cell(this);
    }

    // calculate new position
    Iterator it = sCells.iterator();
    while(it.hasNext()) {
      Cell other = (Cell) it.next();

      // if the cell from the iterator is us don't do anything
      if(this == other) {
        continue;
      }

      // check for collision
      int thisSize = getSize();
      int otherSize = other.getSize();
      if(((this.mX > other.mX-otherSize && this.mX < other.mX+otherSize) &&
        (this.mY > other.mY-otherSize && this.mY < other.mY+otherSize)) ||
        ((other.mX > this.mX-thisSize && other.mX < this.mX+thisSize) &&
        (other.mY > this.mY-thisSize && other.mY < this.mY+thisSize))) {

        // randomly move the cells away
        if(this.mX < other.mX) {
          this.mX -= int(random(1,3));
        }
        else {
          this.mX += int(random(1,3));
        }
        if(this.mY < other.mY) {
          this.mY -= int(random(1,3));
        } 
        else {
          this.mY += int(random(1,3));
        }

        // check if we moved out of the world
        if(this.mX > WIDTH-10) {
          this.mX = WIDTH-10 - int(random(1,3));
        }
        if(this.mX < 10) {
          this.mX = 10 + int(random(1,3));
        }
        if(this.mY > HEIGHT-10) {
          this.mY = HEIGHT-10 - int(random(1,3));
        }
        if(this.mY < 10) {
          this.mY = 10 + int(random(1,3));
        }

        if(other.mX > WIDTH-10) {
          other.mX = WIDTH-10 - int(random(1,3));
        }
        if(other.mX < 10) {
          other.mX = 10 + int(random(1,3));
        }
        if(other.mY > HEIGHT-10) {
          other.mY = HEIGHT-10 - int(random(1,3));
        }
        if(other.mY < 10) {
          other.mY = 10 + int(random(1,3));
        }
      }
    }
  }

  // get size of this cell
  public int getSize() {
    return mGenome.mSize.mValue + BORDER_DIST;
  }

  // paint this cell
  public void paint() {
    fill(mGenome.mBodyRed.mValue, mGenome.mBodyGreen.mValue, mGenome.mBodyBlue.mValue);
    stroke(mGenome.mLineRed.mValue, mGenome.mLineGreen.mValue, mGenome.mLineBlue.mValue);
    switch(mGenome.mShape.mValue) {
    case CIRCLE:
      ellipseMode(CENTER);
      ellipse(mX, mY, mGenome.mSize.mValue, mGenome.mSize.mValue);
      break;

    case ELLIPSEH:
      ellipseMode(CENTER);
      ellipse(mX, mY, mGenome.mSize.mValue*1.5, mGenome.mSize.mValue/2);
      break;

    case RECTANGULARH:
      rectMode(CENTER);
      rect(mX, mY, mGenome.mSize.mValue*1.5, mGenome.mSize.mValue/2);
      break;

    case ELLIPSEV:
      ellipseMode(CENTER);
      ellipse(mX, mY, mGenome.mSize.mValue/2, mGenome.mSize.mValue*1.5);
      break;

    case RECTANGULARV:
      rectMode(CENTER);
      rect(mX, mY, mGenome.mSize.mValue/2, mGenome.mSize.mValue*1.5);
      break;

    case QUADRAT:
      rectMode(CENTER);
      rect(mX, mY, mGenome.mSize.mValue, mGenome.mSize.mValue);
      break;

    case TRIANGLE:
      triangle(mX, mY-mGenome.mSize.mValue,
      mX-mGenome.mSize.mValue, mY+mGenome.mSize.mValue,
      mX+mGenome.mSize.mValue, mY+mGenome.mSize.mValue);
      break;

    default:
      throw new RuntimeException("b0rken");
    }
  }

  // get string for shape of cell
  public String getShape() {
    switch(mGenome.mShape.mValue) {
    case CIRCLE:
      return "CIRCLE";

    case ELLIPSEH:
      return "HORIZONTAL ELLIPSE";

    case RECTANGULARH:
      return "HORIZONTAL RECTANGULAR";

    case ELLIPSEV:
      return "VERTICAL ELLIPSE";

    case RECTANGULARV:
      return "VERTICAL RECTANGULAR";

    case QUADRAT:
      return "QUADRAT";

    case TRIANGLE:
      return "TRIANGLE";

    default:
      throw new RuntimeException("b0rken");
    }
  }
}

