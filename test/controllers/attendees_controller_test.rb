require 'test_helper'

class AttendeesControllerTest < ActionController::TestCase
  setup do
    @attendee = attendees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendee" do
    assert_difference('Attendee.count') do
      post :create, attendee: { attended: @attendee.attended, event: @attendee.event, number: @attendee.number, order_date: @attendee.order_date, order_email: @attendee.order_email, order_ip: @attendee.order_ip, order_name: @attendee.order_name, order_reference: @attendee.order_reference, price: @attendee.price, status: @attendee.status, tags: @attendee.tags, ticket: @attendee.ticket, ticket_email: @attendee.ticket_email, ticket_name: @attendee.ticket_name, ticket_reference: @attendee.ticket_reference, unique_order_url: @attendee.unique_order_url, unique_ticket_url: @attendee.unique_ticket_url, void: @attendee.void }
    end

    assert_redirected_to attendee_path(assigns(:attendee))
  end

  test "should show attendee" do
    get :show, id: @attendee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendee
    assert_response :success
  end

  test "should update attendee" do
    patch :update, id: @attendee, attendee: { attended: @attendee.attended, event: @attendee.event, number: @attendee.number, order_date: @attendee.order_date, order_email: @attendee.order_email, order_ip: @attendee.order_ip, order_name: @attendee.order_name, order_reference: @attendee.order_reference, price: @attendee.price, status: @attendee.status, tags: @attendee.tags, ticket: @attendee.ticket, ticket_email: @attendee.ticket_email, ticket_name: @attendee.ticket_name, ticket_reference: @attendee.ticket_reference, unique_order_url: @attendee.unique_order_url, unique_ticket_url: @attendee.unique_ticket_url, void: @attendee.void }
    assert_redirected_to attendee_path(assigns(:attendee))
  end

  test "should destroy attendee" do
    assert_difference('Attendee.count', -1) do
      delete :destroy, id: @attendee
    end

    assert_redirected_to attendees_path
  end
end
