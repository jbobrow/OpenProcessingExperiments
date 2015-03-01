
// Quad-Tree-implementation.
// Written by Jakob Thomsen.
// (see http://en.wikipedia.org/wiki/Quadtree)

class QuadTreeNode
{
  // Information is only stored in leafs, i.e. nodes is non-null.
  boolean content;
  QuadTreeNode[] nodes;

  QuadTreeNode()
  {
  }

  QuadTreeNode(boolean _content)
  {
    content = _content;
  }

  int index(int x, int y, int level)
  {
    int ix = (x >> (level - 1)) & 1;
    int iy = (y >> (level - 1)) & 1;

    return (iy << 1) | (ix << 0);
  }

  int get_level(int x, int y, int level)
  {
    // leaf reached (max. depth)
    if (level <= 0)
    { 
      return 0;
    }

    // leaf reached (no sub-trees)
    if (nodes == null)
    { 
      return level;
    }

    QuadTreeNode SubTree = nodes[index(x, y, level)];
    return SubTree.get_level(x, y, level - 1);
    /*
    QuadTreeNode SubTree = this;
     int L; 
     for(L = level; L > 0 && SubTree != null; L--)
     {
     SubTree = SubTree.nodes[index(x, L)][index(y, L)];
     }
     return L;
     */
  }

  boolean get_value(int x, int y, int level)
  {
    // leaf reached (max. depth)
    if (level <= 0)
    { 
      return content;
    }

    // leaf reached (no sub-trees)
    if (nodes == null)
    { 
      return content;
    }

    QuadTreeNode SubTree = nodes[index(x, y, level)];
    return SubTree.get_value(x, y, level - 1);
  }

  void set_value(int x, int y, boolean new_content, int level)
  {
    // leaf reached (max. depth)
    if (level <= 0)
    {
      // TODO: implement list of cargo-elements
      // so different elements can co-exist at node
      content = new_content;

      return;
    }

    int idx = index(x, y, level);

    // sub-dividable leaf
    if (nodes == null)
    {
      if (content == new_content)
      {
        return;
      }

      nodes = new QuadTreeNode[4];
      // NOTE: need to create DIFFERENT new nodes,
      //       otherwise changing one would change the others by reference!
      nodes[0] = new QuadTreeNode(content);
      nodes[1] = new QuadTreeNode(content);
      nodes[2] = new QuadTreeNode(content);
      nodes[3] = new QuadTreeNode(content);

      // Information ONLY in leaf nodes!
      // content = null;
    }

    // composite node
    nodes[idx].set_value(x, y, new_content, level - 1);

    // can sub-nodes be combined?
    if (nodes[0].content != new_content)
    { 
      return;
    }
    if (nodes[1].content != new_content)
    { 
      return;
    }
    if (nodes[2].content != new_content)
    { 
      return;
    }
    if (nodes[3].content != new_content)
    { 
      return;
    }

    // all sub-trees are leaves of equal content
    nodes = null;
    content = new_content;
  }
}

class QuadTree
{
  int levels = 0;
  QuadTreeNode root;

  QuadTree()
  {
  }

  QuadTree(int _levels)
  {
    levels = _levels;
    root = new QuadTreeNode();
  }

  QuadTree(int _levels, boolean content)
  {
    levels = _levels;
    root = new QuadTreeNode(content);
  }

  int max_levels()
  {
    return levels;
  }

  int get_size()
  {
    return 1 << levels;
  }

  int get_level(int x, int y)
  {
    return root.get_level(x, y, levels);
  }

  boolean get_value(int x, int y)
  {
    return root.get_value(x, y, levels);
  }

  // WARNING:
  // changing a inserted value by reference-side-effect
  // corrupts the tree 
  void set_value(int x, int y, boolean content)
  {
    root.set_value(x, y, content, levels);
  }
}

void circle(QuadTree tree, int xc, int yc, int r, boolean content)
{
  int x0 = max(0, xc - r);
  int y0 = max(0, yc - r);
  int x1 = min(tree.get_size(), xc + r);
  int y1 = min(tree.get_size(), yc + r);

  for (int y = y0; y < y1; y++)
  {
    for (int x = x0; x < x1; x++)
    {
      int dx = x - xc;
      int dy = y - yc;
      if(dx * dx + dy * dy < r * r)
      {
        tree.set_value(x, y, content);
      }
    }
  }
}

void display(QuadTree tree)
{
  strokeWeight(1);
  for (int v = 0; v < tree.get_size(); v++)
  {
    for (int u = 0; u < tree.get_size(); u++)
    {
      boolean content = tree.get_value(u, v);
      stroke(content ? 1 : 0);
      point(u, v);
    }
  }
}

void display_levels(QuadTree tree)
{
  strokeWeight(1);
  for (int v = 0; v < tree.get_size(); v++)
  {
    for (int u = 0; u < tree.get_size(); u++)
    {
      int level = tree.get_level(u, v);

      int red = (level >> 0) & 1;
      int green = (level >> 1) & 1;
      int blue = (level >> 2) & 1;

      stroke(red, green, blue);
      point(u, v);
    }
  }
}

QuadTree g_tree;

void setup()
{
  size(512, 512);
  colorMode(RGB, 1);
  g_tree = new QuadTree(9, true);
  g_tree.set_value(1, 0, false);
  g_tree.set_value(1, 0, true);
  circle(g_tree, 0, 0, g_tree.get_size(), false);
}

void draw()
{
  background(1, 0, 0, 1);
  // display(g_tree);
  display_levels(g_tree);
  noLoop();
  
  /*
  if(mousePressed)
  {
    if(mouseButton == LEFT)
    {
      circle(g_tree, mouseX, mouseY, g_tree.get_size() / 10, false);
    }
    
    if(mouseButton == RIGHT)
    {
      circle(g_tree, mouseX, mouseY, g_tree.get_size() / 10, true);
    }
  }
  */
}

