FOUR KEYS OF HASHING

one-way -- 

    given an input we can easily produce the output but not vice versa

deterministic -- 

    same input produces same output every time

uniform --

    reduce the amount of possible hash collisions
    -- pigeon hole problem

sensitive --

    a small change to the input results in a m entirely different hash

SALTING

    --adds entropy to common passwords by pairing them with a random string and generating the hash from that

    -- makes it computationally unfeasible to brute force hashed password, or use a rainbow table, even for the most common passwords

BCRYPT

    one way hashing function

    incorporates salt to prevent hash/rainbow table attacks

    slower relative to other hashing algos like md5, sha-1, sha-2

    resistant to brute force

    verifies if 2 hassles were created from the same input without needing to reveal them

    include the bcrypt gem in the gemfile to use in ruby project


3 KEY AUTH FUNCTIONALITIES

    sign up new user
    login existing
    sign out existing 

SIGN UP

    get '/users/new', to: 'users#new'
    post '/users' to: 'users#create'

HOW DO WE SIGN UP A USER

    pass params(username, password) through a form
    create new instance of user with these params
    try to save user in db
    login redirect show errors

ROUTES FOR LOGIN

    get '/session/new', to: 'session#new'
    post '/session' to: 'session#create'

    resource :session only [:new, :create]

HOW WE LOGIN USERS

    database does not know anything about who is logged in
    the logged in status depends on cookies
    the controller modifies our cookies using the session
    a user is logged in if 

    user.session_token == session[:session_token]

WHAT THE HECK IS THE SESSION THING?

    hash like object that we cn add kry value pairs to, allowing fir nic interface to manage cookies on out site and allow data tp persist across request response 

ROUTES FOR LOGOUT

    reset the users session token'
    nidify the sessions session token