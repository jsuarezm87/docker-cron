const { syncDB } = require('../../tasks/sync-bd');


describe("Pruebas en Sync-DB", () => {

  test("Debe de ejecutar el proceso 2 veces", () => {
    syncDB();
    const times = syncDB();
    expect(times).toBe(2);
  });  

});
