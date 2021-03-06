class Model {
  Model({this.text, this.id});

  String text;
  int id;
}

int getNextId(List<Model> models) {
  int next = 0;
  models.forEach((m) {
    if (m.id > next) {
      next = m.id;
    }
  });
  return next + 1;
}

