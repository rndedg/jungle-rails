describe("it should visit the home page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("Should show products on the home page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Should add an item to the cart and check that the counter increased", () => {
    cy.contains("My Cart (0)").should('be.visible');
    cy.contains('Add').click({ force: true });
    cy.contains("My Cart (1)").should('be.visible');
  });
});