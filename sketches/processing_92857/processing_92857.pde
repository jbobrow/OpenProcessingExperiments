
class Block {
  // store position of this instance, and which type of block it is
  int x, y, which;

  Block( int xx , int yy , int ww ) {
    x = xx;
    y = yy;
    which = ww;
  }

  // basic question is can the player move in the specified dir?
  //   if yes, then return true
  //   if no, then return false
  //
  boolean canIMove( int dir ) {
    if ( ( which == iTop          &&  (dir == mLeft || dir == mRight || dir == mDown) )  ||
         ( which == iLeft         &&  (dir == mRight || dir == mDown || dir == mUp)   )  ||
         ( which == iRight        &&  (dir == mLeft || dir == mDown || dir == mUp)    )  ||
         ( which == iBottom       &&  (dir == mLeft || dir == mRight || dir == mUp)   )  ||
         ( which == iTopLeft      &&  (dir == mRight || dir == mDown)                 )  ||
         ( which == iTopRight     &&  (dir == mLeft || dir == mDown)                  )  ||
         ( which == iBottomLeft   &&  (dir == mRight || dir == mUp)                   )  ||
         ( which == iBottomRight  &&  (dir == mLeft || dir == mUp)                    )  ||
         ( which == iTopHalf      &&  (dir == mDown)                                  )  ||
         ( which == iBottomHalf   &&  (dir == mUp)                                    )  ||
         ( which == iRightHalf    &&  (dir == mLeft)                                  )  ||
         ( which == iLeftHalf     &&  (dir == mRight)                                 )  ||
         ( which == iTopBottom    &&  (dir == mLeft || dir == mRight)                 )  ||
         ( which == iLeftRight    &&  (dir == mDown || dir == mUp)                    )  ||
         ( which == iOpen ) ) {  // if open, can go any direction
       return true;  
    }

    // defaults to false, iClosed will wind up here since we don't catch it above
    return false;
  }

  // display this block
  //
  void display () {
    image( images[which], x, y );
  }
}


