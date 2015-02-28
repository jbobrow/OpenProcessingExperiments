
class Field {
  private int mineCount;
  private boolean mine;
  private boolean hidden;
  private boolean marked;

  public Field() {
    mineCount = 0;
    mine = false;
    hidden = true;
    marked = false;
  }

  int getMineCount() {
    return mineCount;
  }

  void raiseMineCount() {
    mineCount++;
  }

  boolean isMine() {
    return mine;
  }

  void setMine() {
    mine = true;
  }

  boolean isHidden() {
    return hidden;
  }

  void reveal() {
    hidden = false;
    marked = false;
  }

  boolean isMarked() {
    return marked;
  }

  void toggleMark() {
    marked = !marked;
  }
}


