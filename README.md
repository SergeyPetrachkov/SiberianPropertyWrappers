# SiberianPropertyWrappers

A bunch of property wrappers.

## Master user defaults like this:

```Swift
final class SimpleStorage: IStorage {
  // MARK: - Private details
  @CodableUserDefault("localUser", defaultValue: nil)
  private var localUser: User?

  @CodableUserDefault("myNotes", defaultValue: [])
  private var myNotes: [Note]
  
  @UserDefault("producerOnboardingFinished", defaultValue: false)
  var producerOnboardingFinished: Bool

  @UserDefault("needShowCreateHint", defaultValue: false)
  var needShowCreateHint: Bool

  @UserDefault("shownCoachEngagement", defaultValue: false)
  var shownCoachEngagement: Bool
  
  @UserDefault("shownSelectExercise", defaultValue: false)
  var shownSelectExercise: Bool

  func getUser() -> User? {
    return self.localUser
  }

  func saveUser(_ user: User) {
    self.localUser = user
  }

  func getMyNotes() -> [Note] {
    return self.myNotes
  }

  func createNote(_ note: Note) {
    var notes = self.myNotes
    notes.append(note)
    self.myNotes = notes
  }
}

```
