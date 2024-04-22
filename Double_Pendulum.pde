
PVector gravity = new PVector (0, 1);

Bob bob1;
Bob bob2;



void setup() {
  size(800, 800);
  bob1 = new Bob(new PVector (width/2, 0), new PVector( width/2 + 200, 0));
  bob2 = new Bob(new PVector (width/2 + 200, 0), new PVector ( width/2 + 400, 0));
 
}

void draw() {

  background(255);

  bob1.update();
  bob1.display();
  bob2.start = bob1.end;
  bob2.velocity.add(bob1.velocity);
  bob2.update();
  bob2.display(); 
  bob2.velocity.sub(bob1.velocity);
}

class Bob {

  PVector start;
  PVector end;
  float size;
  float ropeSize;
  PVector velocity;
  float angle;

  Bob(PVector start, PVector end) {
    this.start = start;
    this.end = end;
    size = 10;
    ropeSize = 50;

    velocity = new PVector(0, 0);
  }

  void fixRope() {
  }

  void update() {
    velocity.add(gravity);
    angle = PVector.angleBetween(new PVector(0, 10), PVector.sub(end, start));

    float T = gravity.mag() ;

    if (end.x <start.x) {
      velocity.x += T * sin(angle);
    } else {
      velocity.x -= T * sin(angle);
    }
    velocity.y -= 2*T * cos(angle) ;
    end.add(velocity);
  }

  void display() {
    // translate( width/2, 0);
    strokeWeight(3);
    stroke(0);



    line (start.x, start.y, end.x, end.y);

    circle(end.x, end.y, size);
  }
}
